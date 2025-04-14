{-# LANGUAGE OverloadedStrings #-}

module Main where

import Parsers.SqlParser
import SqlHandler.ThreadsRunner (threadRunner)
import System.Directory
import System.Directory.Internal.Prelude (getArgs)

main :: IO ()
main = do
  -- Argument order : exec_name <sql file path in relative> <pgsql uri> <separator_string> <thread number>
  args <- getArgs
  case args of
    [path, uri, null_val, n] -> do
      dir <- getCurrentDirectory -- Setting a monoid value in to a value
      let file = dir ++ "/" ++ path

      let query_pool = parser file null_val

      pure_query_pool <- query_pool

      print pure_query_pool

      let parsed_n = read n
      threadRunner pure_query_pool parsed_n uri
    _ -> do putStrLn "Error: Not all arguments where put"
