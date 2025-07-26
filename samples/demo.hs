-- Simple Haskell theme with ADTs
module Theme where

data Variant = Veil | Obsidian | Radiance
  deriving (Show, Eq)

data Color = Color String String  -- bg fg
  deriving (Show, Eq)

getColor :: Variant -> Color
getColor Veil     = Color "#1E1E2E" "#D9E0EE"
getColor Obsidian = Color "#000A0F" "#C0C0CE" 
getColor Radiance = Color "#F7F7FF" "#1E1E2E"

applyTheme :: Variant -> Bool -> String
applyTheme variant transparent = 
  let Color bg fg = getColor variant
      bgColor = if transparent then "none" else bg
  in "Theme: " ++ show variant ++ ", BG: " ++ bgColor

-- Pattern matching with Maybe
parseVariant :: String -> Maybe Variant
parseVariant "veil"     = Just Veil
parseVariant "obsidian" = Just Obsidian
parseVariant "radiance" = Just Radiance
parseVariant _          = Nothing

-- Usage:
-- applyTheme Veil False
-- parseVariant "obsidian"