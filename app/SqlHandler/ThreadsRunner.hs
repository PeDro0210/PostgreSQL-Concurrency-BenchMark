module SqlHandler.ThreadsRunner where

import Control.Concurrent (forkIO)
import Control.Concurrent.MVar
import Control.Monad (forM_, replicateM)
import SqlHandler.QueryRunner (dbConnectionHandler)

forkThreads :: Int -> IO () -> IO ()
forkThreads n action = do
  doneVars <- replicateM n newEmptyMVar -- showing that is finish
  -- Idunno why using the forM_ rather than forM, but it seems like the forM can't manage []
  putStrLn "Query Group Start"
  forM_ (zip [1 .. n] doneVars) $ \(i, doneVar) -> do
    forkIO $ do
      action
      putMVar doneVar () -- signal completion
      -- Wait for all threads to complete
  forM_ doneVars takeMVar
  putStrLn "Query Group Finish \n"

threadRunner :: [[String]] -> Int -> String -> IO ()
threadRunner queries n uri = do
  mutex <- newMVar ()
  mapM_ (\query -> forkThreads n (dbConnectionHandler mutex query uri)) queries
