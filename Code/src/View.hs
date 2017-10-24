-- | This module defines how to turn
--   the game state into a picture
module View where

import Graphics.Gloss
import Model

view :: GameState -> IO Picture
view = return . viewPure

{- 
drawing a list of pictures, using Pictures, means the first will be in the back.
So, Pictures [GameMap, Boosts, Bombs, Opponents, Player] should draw it correctly.

Translate all the Sprites of all objects in the [GameObject] to their GridPosition.
Add all the sprites above to one list
Call Pictures on the list above
-}

viewPure :: GameState -> Picture
viewPure gstate = case infoToShow gstate of
  ShowNothing   -> blank
  ShowANumber n -> color green (text (show n))
  ShowAChar   c -> color green (text [c])