{-# LANGUAGE DeriveGeneric #-}

module Business.User
  ( User(..)
  , listUsers
  ) where

import Data.Aeson
import Data.Aeson.Types
import GHC.Generics

data User = User
  { id        :: Int
  , firstName :: String
  , lastName  :: String
  } deriving (Eq, Show, Generic)

instance ToJSON User

{-| List all users.
-}
listUsers :: IO [User]
listUsers = pure [User 1 "Isaac" "Newton", User 2 "Albert" "Einstein"]
