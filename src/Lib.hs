{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Lib
  ( app
  ) where

import Servant
import Business.User (User, listUsers)
import Control.Monad.IO.Class (liftIO)

type API = "users" :> Get '[JSON] [User]

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = liftIO listUsers
