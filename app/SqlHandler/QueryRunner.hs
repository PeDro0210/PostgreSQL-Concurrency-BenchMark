{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Control.Concurrent (MVar, threadDelay, withMVar)
import Hasql.Connection as Connection
import qualified Hasql.Connection.Setting as Connection
import qualified Hasql.Connection.Setting.Connection as Connection
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (Statement))

dbConnectionHandler :: MVar () -> [String] -> IO ()
dbConnectionHandler mutex queries = do
  -- Okay now going serious

  -- TODO: change the connection type to a pool
  -- Turns the pg url in to the connection "Functor" (still haven't grasp the full concept)
  let settings = Connection.string "postgresql://pedro0210:idunno_com@localhost:5432/db" -- wtf NIKITA, that hsql documentaiton is ass
  let last_cast = [Connection.connection settings] -- I find this cast soo fucking useless, but still... THE FUCKING LIBRARY WANT'S IT THAT WAY
  acquireResult <-
    Connection.acquire
      last_cast
  -- Always remeber your error handleling
  case acquireResult of
    Left err -> print err -- for connection errors
    Right connection -> do
      result <- SessionInstance.run (queryCallSession queries) connection
      case result of
        Left err -> withMVar mutex $ \_ -> do print err
        Right val -> withMVar mutex $ \_ -> do putStrLn "Query Succed"

queryCallSession :: [String] -> SessionInstance.Session [()]
queryCallSession queries = do
  sequence (fmap (\query -> SessionInstance.statement () (genericStatement query)) queries) -- wraps it in the Session context,

genericStatement :: String -> Statement () ()
genericStatement query =
  -- the statement needs a ByteString to work
  Statement (B.fromString query) Encoders.noParams Decoders.noResult True
