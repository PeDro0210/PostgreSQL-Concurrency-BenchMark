module SqlHandler.ThreadsRunner where

import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.MVar
import Control.Monad (forM, forM_, replicateM)
import SqlHandler.QueryRunner (dbConnectionHandler)

-- TODO: fix this function
forkThreads :: Int -> IO () -> IO ()
forkThreads n action = do
  doneVars <- replicateM n newEmptyMVar -- showing that is finish
  -- Idunno why using the forM_ rather than forM, but it seems like the forM can't manage []
  forM_ (zip [1 ..] doneVars) $ \(i, doneVar) -> do
    -- Okay, weird zipepr shit but okay
    forkIO $ do
      action
      putMVar doneVar () -- signal completion

  -- Wait for all threads to complete
  forM_ doneVars takeMVar

threadRunner :: [String] -> IO ()
threadRunner queries = do
  mutex <- newMVar ()
  mapM_ (forkThreads 5 . dbConnectionHandler mutex) queries
