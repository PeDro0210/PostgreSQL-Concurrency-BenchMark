-- dunno the exact need of this, but the documntaiton says soo
{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Data.Time
import GHC.IO.Exception (stackOverflow)
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import qualified Hasql.Pool as TPool
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (..))
import Text.Printf (printf)

dbConnectionHandler :: [String] -> TPool.Pool -> IO ()
dbConnectionHandler queries pool = do
  start <- getCurrentTime

  result <- TPool.use pool (queryCallSession queries)

  stop <- getCurrentTime

  -- ignore this fucking whole casting process
  let timePassed = diffUTCTime stop start -- do the diff between 2 UTCTime
  let timeParsed = nominalDiffTimeToSeconds timePassed -- cast it's
  let timeReal = toRational timeParsed -- found it on a stackOverflow post, I didn't found a way to cast it directly to a double type
  case result of
    Left _ -> do
      printf "-> %.5f | Failed |\n" (fromRational timeReal :: Double)
    Right _ ->
      printf "-> %.5f | Succed |\n" (fromRational timeReal :: Double)

queryCallSession :: [String] -> SessionInstance.Session [()]
queryCallSession queries = do
  sequence -- wraps all the queries element in to the Session context,
    ( map
        ( \query ->
            SessionInstance.statement
              ()
              (genericStatement query)
        )
        queries
    )

genericStatement :: String -> Statement () ()
genericStatement query =
  -- the statement needs a ByteString to work
  Statement (B.fromString query) Encoders.noParams Decoders.noResult True
