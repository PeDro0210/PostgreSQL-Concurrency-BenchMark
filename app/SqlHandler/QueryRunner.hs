-- dunno the exact need of this, but the documntaiton says soo
{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Data.Time
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import qualified Hasql.Pool as TPool
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (..))
import Text.Printf (printf)

dbConnectionHandler :: [String] -> TPool.Pool  -> IO ()
dbConnectionHandler queries pool = do
  -- Text Parsing for satisfying the pool.settings
   start <- getCurrentTime

   result <- TPool.use pool (queryCallSession queries)

   stop <- getCurrentTime

   -- ignore this fucking whole parsing process
   let timePassed = diffUTCTime stop start
   let timeParsed = nominalDiffTimeToSeconds timePassed
   let timeReal = toRational timeParsed

   case result of
     Left err -> do
       printf "-> %.5f | Failed |\n" (fromRational timeReal :: Double)
     Right _ ->
       printf "-> %.5f | Succed |\n" (fromRational timeReal :: Double)

queryCallSession :: [String] -> SessionInstance.Session [()]
queryCallSession queries = do
  sequence
    ( fmap
        ( \query ->
            SessionInstance.statement
              ()
              (genericStatement query)
        )
        queries -- wraps it in the Session context,
    )

genericStatement :: String -> Statement () ()
genericStatement query =
  -- the statement needs a ByteString to work
  Statement (B.fromString query) Encoders.noParams Decoders.noResult True
