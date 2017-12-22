module Main where

import Network.Wai
import Network.Wai.Handler.Warp
import Lib (app)

main :: IO ()
main = run 8080 app
