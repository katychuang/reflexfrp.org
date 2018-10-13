{-# LANGUAGE OverloadedStrings #-}
module Frontend.Footer (footer) where

import Control.Monad (forM_)
import qualified Frontend.FontAwesome as FA
import Reflex.Dom

footer :: DomBuilder t m => m ()
footer = do
  el "p" $ text "Check us out on Hackage or join the community IRC chat!"
  let links =
        [ ("Hackage", "https://hackage.haskell.org/package/reflex")
        , ("irc.freenode.net #reflex-frp", "http://webchat.freenode.net/?channels=%23reflex-frp&uio=d4")
        ]
  forM_ links $ \(name, url) -> do
    elAttr "a" ("href" =: url) $ text name
    el "br" blank
  el "br" blank
  let socialIcon icon title url = elAttr "a" ("href" =: url <> "title" =: title) $ do
        FA.faIcon icon def
  socialIcon FA.FaTwitter "Twitter" "https://twitter.com/search?q=%23reflexfrp"
  socialIcon FA.FaGithub "GitHub" "http://github.com/reflex-frp"
  socialIcon FA.FaReddit "Reddit" "http://reddit.com/r/reflexfrp"
