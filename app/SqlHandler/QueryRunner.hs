-- dunno the exact need of this, but the documntaiton says soo
{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Control.Concurrent (MVar, threadDelay, withMVar)
import Data.Text as Dt
import Data.Time
import Hasql.Connection as Connection
import Hasql.Connection.Setting as Connection
import Hasql.Connection.Setting.Connection as Connection
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (Statement))
import Text.Printf (printf)

dbConnectionHandler :: MVar () -> [String] -> String -> IO ()
dbConnectionHandler mutex queries connectionString = do
  -- Okay now going serious
  -- "postgresql://pedro0210:idunno_com@localhost:5432/db"
  --
  -- Turns the pg url in to the connection "Functor" (still haven't grasp the full concept)

  let parsedConnection = Dt.pack connectionString

  let settings = Connection.string parsedConnection -- wtf NIKITA, that hsql documentaiton is ass
  let last_cast = [Connection.connection settings] -- I find this cast soo fucking useless, but still... THE FUCKING LIBRARY WANT'S IT THAT WAY
  acquireResult <-
    Connection.acquire
      last_cast

  start <- getCurrentTime
  -- Always remeber your error handleling
  case acquireResult of
    Left err -> print err -- for connection errors
    Right connection -> do
      result <- SessionInstance.run (queryCallSession queries) connection
      stop <- getCurrentTime

      -- Ton of time type casting
      let timePassed = diffUTCTime stop start -- get's the difference
      let timeParsed = nominalDiffTimeToSeconds timePassed -- pass that differente in to the Pico type, which can be cast in to a rational number
      let timeReal = toRational timeParsed -- Rational can be casted to any number type
      case result of
        Left err -> withMVar mutex $ \_ -> do
          printf "| %.5f | Failed |\n" (fromRational timeReal :: Double) -- the cool casting
        Right val -> withMVar mutex $ \_ -> do
          printf "| %.5f | Succed |\n" (fromRational timeReal :: Double)

queryCallSession :: [String] -> SessionInstance.Session [()]
queryCallSession queries = do
  sequence (fmap (\query -> SessionInstance.statement () (genericStatement query)) queries) -- wraps it in the Session context,

genericStatement :: String -> Statement () ()
genericStatement query =
  -- the statement needs a ByteString to work
  Statement (B.fromString query) Encoders.noParams Decoders.noResult True
