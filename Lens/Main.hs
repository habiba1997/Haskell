{-# LANGUAGE TemplateHaskell #-}

module Main where

import Control.Lens

data Player = Player
  { _playerName   :: String
  , _playerSalary :: Int
  , _playerStats  :: PlayerStats}
  deriving (Show)

data PlayerStats = PlayerStats
  { _goals       :: Int
  , _gamesPlayed :: Int }
  deriving (Show)

data Team = Team
  { _teamName    :: String
  , _teamPlayers :: [Player] }
  deriving (Show)

makeLenses ''Player
makeLenses ''PlayerStats
makeLenses ''Team


getPlayerName :: Player -> String
getPlayerName player =
  player ^. playerName

getPlayerGoals :: Player -> Int
getPlayerGoals player =
  player ^. (playerStats . goals)

setPlayerSalary :: Player -> Int -> Player
setPlayerSalary player newSalary =
  player & playerSalary .~ newSalary

increasePlayerSalary :: Player -> Int -> Player
increasePlayerSalary player raise =
  player & playerSalary +~ raise

incrementPlayerGoals :: Player -> Player
incrementPlayerGoals player =
  player & playerStats . goals +~ 1

--  for loop
incrAllPlayersGamesPlayed :: Team -> Team
incrAllPlayersGamesPlayed team =
  team & teamPlayers . traverse 
       . playerStats . gamesPlayed +~ 1

-- for loop
totalGamesPlayed :: Team -> Int
totalGamesPlayed team =
  team & sumOf (teamPlayers . traverse . playerStats . gamesPlayed)

bob :: Player
bob = Player
  { _playerName = "Bob"
  , _playerSalary = 3
  , _playerStats = PlayerStats
      { _goals = 1
      , _gamesPlayed = 1000
      }
  }

charlie :: Player
charlie = Player
  { _playerName = "Charlie"
  , _playerSalary = 100
  , _playerStats = PlayerStats
      { _goals = 1000
      , _gamesPlayed = 10
      }
  }

leafs :: Team
leafs = Team
  { _teamName = "Leafs"
  , _teamPlayers = [bob, charlie] }

main :: IO ()
main = do
    -- Test getPlayerName function ("bob")
    putStrLn $ "Player name: " ++ getPlayerName bob

    -- Test getPlayerGoals function (1000)
    putStrLn $ "Player goals: " ++ show (getPlayerGoals charlie)

    -- Test setPlayerSalary function
    let newBob = setPlayerSalary bob 5
    putStrLn $ "Bob's salary after change: " ++ show (_playerSalary newBob)

    -- Test increasePlayerSalary function
    let newCharlie = increasePlayerSalary charlie 1000
    putStrLn $ "Charlie's salary after raise: " ++ show (_playerSalary newCharlie)

    -- Test incrementPlayerGoals function
    let newBob' = incrementPlayerGoals bob
    putStrLn $ "Bob's goals after increment: " ++ show (_playerStats newBob' ^. goals)

    -- Test incrAllPlayersGamesPlayed function
    let newTeam = incrAllPlayersGamesPlayed leafs
    putStrLn $ "New team after incrementing games played: " ++ show (newTeam ^. teamPlayers)

    -- Test totalGamesPlayed function
    putStrLn $ "Total games played by leafs: " ++ show (totalGamesPlayed leafs)

    -- Test totalGamesPlayed function
    putStrLn $ "Total games played by newTeam: " ++ show (totalGamesPlayed newTeam)