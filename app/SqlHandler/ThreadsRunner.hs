module SqlHandler.ThreadsRunner where

import Control.Concurrent (forkIO, threadDelay)
import Control.Monad (forM_, replicateM)
import System.IO
import Control.Concurrent.MVar

-- Forks n threads and waits for all of them to finish
forkThreads :: Int -> String -> IO () -> IO ()
forkThreads n label action = do
    doneVars <- replicateM n newEmptyMVar -- one MVar per thread to signal completion

    forM_ (zip [1..] doneVars) $ \(i, doneVar) -> do
        forkIO $ do
            --putStrLn $ label ++ " " ++ show i ++ " started"
            action
            --putStrLn $ label ++ " " ++ show i ++ " finished"
            putMVar doneVar () -- signal completion

    -- Wait for all threads to complete
    forM_ doneVars takeMVar

printThreadCurrentQuery :: MVar () -> [String] -> IO ()
printThreadCurrentQuery mutex queries = do
    let printQuery query = do
            withMVar mutex $ \_ -> do
                putStrLn $ "Current query: " ++ query
                threadDelay 1000000 -- 1 second delay
    forM_ queries printQuery

main :: IO ()
main = do
    let queries = ["SELECT * FROM table1;", "SELECT * FROM table2;", "SELECT * FROM table3;"]
    mutex <- newMVar ()
    forkThreads 3 "Thread" (printThreadCurrentQuery mutex queries)