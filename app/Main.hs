module Main where

import Parsers.SqlParser
import SqlHandler.ThreadsRunner (threadRunner)
import System.Directory

main :: IO ()
main = do
  -- Applyng the parser
  dir <- getCurrentDirectory -- Setting a monoid value in to a value
  let file = dir ++ "/queries/query_pool.sql"
  -- ->[String]
  let query_pool = parser file "COMMIT;"

  -- String -> IO()
  --
  -- query_pool <$> fork IO hsql_runner
  -- mutex
  -- print query
  -- mutex
  --
  --

  -- TODO: Implement hsql client connection
  -- TODO: implement multithreading
  print =<< query_pool
  pure_query_pool <- query_pool

  threadRunner pure_query_pool
