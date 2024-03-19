import Control.Monad
import Control.Concurrent
import qualified Control.Concurrent.Chan as Chan
import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

main :: IO ()
main = do
  messages <- Chan.newChan
  startGUI defaultConfig $ setup messages

data Message = Message
  { msgSender :: String
  , msgText   :: String }
  deriving Show

setup :: Chan Message -> Window -> UI ()
setup globalMsgs window = do
  msgChan <- liftIO $ Chan.dupChan globalMsgs

  (return window) # set title "Chat"

  nameInput <- UI.input
  msgHistory <- UI.div # set UI.height 200
                       # set UI.width 200
  msgInput <- UI.input
  btnSend <- UI.button #+ [string "Send"]

  getBody window #+
    [ column
      [ row [string "Name: ", element nameInput]
      , element msgHistory
      , row [ element msgInput, element btnSend ]
      ]
    ]

  eIncoming <- incomingMessageEvent msgChan window
  let eConsIncoming = fmap (:) eIncoming
  bHistory <- accumB [] eConsIncoming
  let bHistoryContent = liftA formatMsgs bHistory
  element msgHistory # sink UI.html bHistoryContent

  let eSend = UI.click btnSend
  bMsgInput <- stepper "" $ UI.valueChange msgInput
  bName <- stepper "" $ UI.valueChange nameInput
  let bOutgoing = liftA2 Message bName bMsgInput
      eOutgoing = bOutgoing <@ eSend

  handleOutgoingMessageEvent msgChan eOutgoing
  _ <- liftIO $ UI.register eIncoming $ \msg -> do
      putStrLn ("Receiving(2) " ++ (show msg))

  return ()

formatMsgs :: [Message] -> String
formatMsgs msgs = concat $ reverse $ map formatMsg msgs

formatMsg :: Message -> String
formatMsg msg =
  msgSender msg ++ ": " ++ msgText msg ++ "<p>"

handleOutgoingMessageEvent :: Chan Message -> Event Message -> UI ()
handleOutgoingMessageEvent msgChan eOutgoing = liftIO $ do
  _ <- UI.register eOutgoing $ \msg -> do
    putStrLn ("Sending " ++ (show msg))
    Chan.writeChan msgChan msg
  return ()

incomingMessageEvent :: Chan Message -> Window -> UI (Event Message)
incomingMessageEvent msgChan window = do
  (e,fire) <- liftIO newEvent
  msgThread <- liftIO $ forkIO $ do
    msgList <- Chan.getChanContents msgChan
    forM_ msgList $ \msg -> do
      putStrLn ("Receiving(1) " ++ (show msg))
      atomic window $ fire msg
  on UI.disconnect window $ \() -> liftIO $ do
    killThread msgThread
  return e
