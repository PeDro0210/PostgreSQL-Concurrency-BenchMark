module SqlHandler.ThreadsRunner where

import Control.Concurrent (forkIO)
import Control.Concurrent.MVar
import Control.Monad (forM_, replicateM)
import SqlHandler.QueryRunner (dbConnectionHandler)
import Control.Exception (bracket)
import Data.Text as Dt
import Hasql.Connection.Setting as Connection
import qualified Hasql.Connection.Setting.Connection as ConnSetting
import qualified Hasql.Pool as TPool
import qualified Hasql.Pool.Config as CPool

forkThreads :: Int -> IO () -> IO ()
forkThreads n action = do
  doneVars <- replicateM n newEmptyMVar -- showing that is finish
  -- Idunno why using the forM_ rather than forM, but it seems like the forM can't manage []
  putStrLn "\n"
  forM_ (Prelude.zip [1 .. n] doneVars) $ \(i, doneVar) -> do
    forkIO $ do
      action
      putMVar doneVar () -- signal completion
      -- Wait for all threads to complete
  forM_ doneVars takeMVar

threadRunner :: [[String]] -> Int -> String -> IO ()
threadRunner queries n uri = do
  let parsedConnection = Dt.pack uri
  -- Fucking stupid
  -- Ik is kinda dumb reinstanciate it the pool everytime, but it works also
  let poolSettings =
        CPool.settings -- Fucking stupid documentation of the pool
          [ CPool.size n,
            CPool.acquisitionTimeout 10,
            CPool.agingTimeout 1800,
            CPool.idlenessTimeout 1800,
            CPool.staticConnectionSettings -- not using the dynamic, cause' there's just one uri 
              [Connection.connection (ConnSetting.string parsedConnection)]
          ]

  -- passing each pool and running the statement
  bracket (TPool.acquire poolSettings) TPool.release ( \pool -> do
      mapM_ ( \query -> forkThreads n (dbConnectionHandler  query pool) )queries
    )
