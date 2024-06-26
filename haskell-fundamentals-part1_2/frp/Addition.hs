import Control.Monad
import Data.Maybe
import Text.Read (readMaybe)
import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

main :: IO ()
main = startGUI defaultConfig setup

setup :: Window -> UI ()
setup window = do
  (return window) # set title "Addition"

  input1 <- UI.input
  input2 <- UI.input
  result <- UI.span

  getBody window #+
    [ element input1
    , string " + "
    , element input2
    , string " = "
    , element result ]

  bInput1 <- bValue input1
  bInput2 <- bValue input2

  let bInput1Num = (liftA readMaybe) bInput1
      bInput2Num = (liftA readMaybe) bInput2
      bSum = (liftA2 (liftM2 (+))) bInput1Num bInput2Num
      bResult = (liftA showMaybe) bSum

  element result # sink text bResult
  return ()

bValue :: Element -> UI (Behavior String)
bValue el = stepper "" $ UI.valueChange el

showMaybe :: Show a => Maybe a -> String
showMaybe x = maybe "--" show x