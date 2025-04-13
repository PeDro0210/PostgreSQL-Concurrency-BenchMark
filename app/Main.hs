module Main where

import Parsers.SqlParser
import SqlHandler.ThreadsRunner (threadRunner)
import System.Directory

main :: IO ()
main = do
  -- Applying the parser
  dir <- getCurrentDirectory -- Setting a monoid value in to a value
  let file = dir ++ "/queries/query_pool.sql"

  let query_pool = parser file "-"

  pure_query_pool <- query_pool
  print pure_query_pool

  threadRunner pure_query_pool
