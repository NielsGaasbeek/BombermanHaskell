{-# LANGUAGE TemplateHaskell #-}

module Model where

import Control.Lens
import Control.Lens.TH
import Graphics.Gloss

data LifeStatus = Alive | Dead deriving Show
data GridPosition = GridPosition {
                        _xPos :: Int 
                      , _yPos :: Int
                     } deriving Show
makeLenses ''GridPosition

data Player = Player {
                  _playerPos :: GridPosition
                , playerStatus :: LifeStatus
                , playerBombs :: Int
                , playerSpeedBoostTime :: Float
                , playerSprite :: [Picture]
                } deriving Show
makeLenses ''Player
                
data Opponent = Opponent {
                  _oppPos :: GridPosition
                , _oppStatus :: LifeStatus
                , _oppBombs :: Int
                , _oppSpeedBoostTime :: Float
                , _oppSprite :: [Picture]
                } deriving Show
makeLenses ''Opponent
                
data Block = Wall
           | Box
           | FloorTile

data GridBlock = GridBlock {
                  _blockPosition :: GridPosition
                , blockType :: Block
                , blockSprite :: [Picture]
                }
makeLenses ''GridBlock 
               
data Bomb = Bomb {
                  _bombPosition :: GridPosition
                , timer :: Float
                , bombSprite :: [Picture]
                }
makeLenses ''Bomb
                
data PowerUpType = SpeedBoost
                 | ExtraBombs
                 
data PowerUp = PowerUp {
                  _powerUpPosistion :: GridPosition
                , powerUpType :: PowerUpType
                , powerUpSprite :: [Picture]
                }
makeLenses ''PowerUp
                
type GameMap = [[GridBlock]]

data GameState = GameState {
                  _player :: Player
                , _opponents :: [Opponent]
                , _bombs :: [Bomb]
                , gameMap :: GameMap
                , elapsedTime :: Float
                }
makeLenses ''GameState 
               
data MenuState = MainMenuState
               | PauseMenuState
               
testPlayer = Player (GridPosition 1 1) Alive 3 0 []
state = GameState testPlayer [] [] [[]] 0
opp1 = Opponent (GridPosition 2 3) Alive 3 0 []
opp2 = Opponent (GridPosition 3 3) Alive 3 0 []
opp3 = Opponent (GridPosition 1 3) Alive 3 0 []
state2 = GameState testPlayer [opp1,opp2,opp3] [] [[]] 0