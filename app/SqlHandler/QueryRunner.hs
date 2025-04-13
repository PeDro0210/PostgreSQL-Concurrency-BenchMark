{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Control.Concurrent (MVar, withMVar)
import Hasql.Connection as Connection
import qualified Hasql.Connection.Setting as Connection
import qualified Hasql.Connection.Setting.Connection as Connection
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (Statement))

dbConnectionHandler :: MVar () -> String -> IO ()
dbConnectionHandler mutex query = do
  let settings = Connection.string "postgresql://pedro0210:idunno_com@localhost:5432/db" -- wtf NIKITA, that hsql documentaiton is ass
  let last_cast = [Connection.connection settings] -- I find this cast soo fucking useless, but still... THE FUCKING LIBRARY WANT'S IT THAT WAY
  acquireResult <- Connection.acquire last_cast

  -- Always remeber your error handleling
  case acquireResult of
    Left err -> print err
    Right connection -> do
      result <- SessionInstance.run (queryCallSession query) connection
      withMVar mutex $ \_ -> do
        print result

queryCallSession :: String -> SessionInstance.Session ()
queryCallSession query = do
  SessionInstance.statement () (genericStatement query) -- wraps it in the Session context,

genericStatement :: String -> Statement () ()
genericStatement query =
  Statement (B.fromString query) Encoders.noParams Decoders.noResult True
