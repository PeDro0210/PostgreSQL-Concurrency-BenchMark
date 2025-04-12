module Main where
import Parsers.SqlParser
import System.Directory

main :: IO ()
main = do
    -- Applyng the parser
    dir <- getCurrentDirectory --Setting a monoid value in to a value
    let file = dir ++ "/queries/query_pool.sql"
    let query_pool = parser file "COMMIT;"
    --TODO: Implement hsql client connection
    --TODO: implement multithreading
    print =<< query_pool 

