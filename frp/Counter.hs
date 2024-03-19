import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

main :: IO ()
main = startGUI defaultConfig setup

setup :: Window -> UI ()
setup window = do
  (return window) # set title "Counter"

  buttonUp <- UI.button #+ [string "Up"]
  buttonDown <- UI.button #+ [string "Down"]
  result <- UI.span

  getBody window #+
    [ column
      [ element buttonUp
      , element buttonDown
      , element result
      ]
    ]

  let eUp :: Event ()
      eUp = UI.click buttonUp
      eDown :: Event ()
      eDown = UI.click buttonDown
      eIncrement :: Event (Int -> Int)
      eIncrement = fmap (\() -> (+1)) eUp
      eDecrement :: Event (Int -> Int)
      eDecrement = fmap (\() -> (subtract 1)) eDown
      eChange = unionWith (.) eIncrement eDecrement

  bCounter <- accumB 0 eChange

  let bResult = liftA show bCounter

  element result # sink text bResult
  return ()