{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Prelude hiding (id)
import Lib (app)
import Business.User (User(..))
import Data.Aeson (encode)
import Test.Hspec
import Test.Hspec.Wai
import Test.Hspec.Wai.JSON
import Data.String.Here

main :: IO ()
main = hspec spec

spec :: Spec
spec = with (return app) $ do
  describe "GET /users" $ do
    it "responds with 200 and users" $ do
      let
        body
          = [json| [ { lastName:"Newton", firstName:"Isaac", id:1 }, { lastName:"Einstein", firstName:"Albert", id:2 } ] |]
      get "/users" `shouldRespondWith` body { matchStatus = 200 }
