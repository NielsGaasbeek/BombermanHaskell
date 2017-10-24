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
Scale all the Sprites to be the correct size
Add all the sprites above to one list
Call Pictures on the list above
-}

viewPure :: GameState -> Picture
viewPure gstate = case infoToShow gstate of
  ShowNothing   -> blank
  ShowANumber n -> color green (text (show n))
  ShowAChar   c -> color green (text [c])

-- Currently only works if the map is a square, collums and rows can be even or uneven
translatePicture :: Float -> Float -> Float -> Float -> Picture -> Picture
translatePicture x y cols size pic = translate (scale x (size / cols)) (scale (1 + cols - y) (size / cols)) pic
       where scale a b | a > (cols / 2) = (size / cols) * (a - (cols / 2)) - (size / cols / 2)
                       | otherwise      = -1 * (size / cols) * ((cols / 2) - a) - (size / cols / 2)

scalePicture :: Float -> Float -> Picture -> Picture
scalePicture cols size pic = scale (size / cols / (fst (snd (boundingBox pic)))) (size / cols / (snd (snd (boundingBox pic)))) pic