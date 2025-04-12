module SqlHandler.ThreadsRunner where

import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.MVar
import Control.Monad (forM, forM_, replicateM)

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

-- TODO: Change this with the query runner
printThreadCurrentQuery :: MVar () -> String -> IO ()
printThreadCurrentQuery mutex query = do
  withMVar mutex $ \_ -> do
    threadDelay 100000
    putStrLn $ "Current query: " ++ query

threadRunner :: [String] -> IO ()
threadRunner queries = do
  mutex <- newMVar ()
  mapM_ (forkThreads 2 . printThreadCurrentQuery mutex) queries
