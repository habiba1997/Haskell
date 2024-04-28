{-# LANGUAGE TemplateHaskell #-}

module LensExamples where

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

incrAllPlayersGamesPlayed :: Team -> Team
incrAllPlayersGamesPlayed team =
  team & teamPlayers . traverse 
       . playerStats . gamesPlayed +~ 1

totalGamesPlayed :: Team -> Int
totalGamesPlayed team =
  team & sumOf (teamPlayers . traverse . playerStats . gamesPlayed)