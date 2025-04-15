-- dunno the exact need of this, but the documntaiton says soo
{-# LANGUAGE OverloadedStrings #-}

module SqlHandler.QueryRunner where

import Codec.Binary.UTF8.Generic as B
import Control.Concurrent (MVar, threadDelay, withMVar)
import Control.Exception (bracket)
import Control.Monad.IO.Class (liftIO)
import Data.Ratio ((%))
import Data.Text as Dt
import Data.Time
import Hasql.Connection as Connection
import Hasql.Connection.Setting as Connection
import Hasql.Connection.Setting.Connection as Connection
import qualified Hasql.Connection.Setting.Connection as ConnSetting
import Hasql.Decoders as Decoders
import Hasql.Encoders as Encoders
import qualified Hasql.Pool as Pool
import qualified Hasql.Pool.Config as Pool
import Hasql.Session as SessionInstance
import Hasql.Statement (Statement (..))
import Text.ParserCombinators.ReadP (satisfy)
import Text.Printf (printf)

dbConnectionHandler :: Int -> [String] -> String -> IO ()
dbConnectionHandler thread_n queries connectionString = do
  -- Text Parsing for satisfying the pool.settings
  let parsedConnection = Dt.pack connectionString

  -- Fucking stupid
  -- Ik is kinda dumb reinstanciate it the pool everytime, but it works also
  let poolSettings =
        Pool.settings -- Fucking stupid documentation of the pool
          [ Pool.size thread_n,
            Pool.acquisitionTimeout 10,
            Pool.agingTimeout 1800,
            Pool.idlenessTimeout 1800,
            Pool.staticConnectionSettings
              [Connection.connection (ConnSetting.string parsedConnection)]
          ]

  -- passing each pool and running the statement
  bracket (Pool.acquire poolSettings) Pool.release $ \pool -> do
    start <- getCurrentTime

    result <- Pool.use pool (queryCallSession queries)

    stop <- getCurrentTime

    -- ignore this fucking whole parsing process
    let timePassed = diffUTCTime stop start
    let timeParsed = nominalDiffTimeToSeconds timePassed
    let timeReal = toRational timeParsed

    case result of
      Left err ->
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
