module Model where

data LifeStatus = Alive | Dead
data GridPosition = GridPosition {
                        xPos :: Int 
                      , yPos :: Int
                     }
                     
data GameObject = Player 
                | Opponent 
                | GridBlock 
                | Bomb

data Player = Player {
                  gridPosition :: GridPosition
                , lifeStatus :: LifeStatus
                , bombAmount :: Int
                , speedBoostTime :: Float
                , sprite :: Picture
                }
                
data Opponent = Opponent {
                  gridPosition :: GridPosition
                , lifeStatus :: LifeStatus
                , bombAmount :: Int
                , speedBoostTime :: Float
                , sprite :: Picture
                }
                
data Block = Wall
           | Box
           | FloorTile

data GridBlock = GridBlock {
                  blockPosition :: GridPosition
                , blockType :: Block
                , sprite :: Picture
                }
                
data Bomb = Bomb {
                  timer :: Float
                , bombPosition :: GridPosition
                , sprite :: Picture
                }
                
data PowerUpType = SpeedBoost
                 | ExtraBombs
                 
data PowerUp = PowerUp {
                  gridPosition :: GridPosition
                , powerUpType :: PowerUpType
                , sprite :: Picture
                }
                
data GameMap = [[GridBlock]]

data GameState = GameState {
                  player :: Player
                , opponents :: [Opponent]
                , bombs :: [Bomb]
                , gameMap :: GameMap
                , elapsedTime :: Float
                }