module Parsers.SqlParser where
import Data.List (isSuffixOf)

parser:: String -> String -> IO [String]
parser file null_val = do  
        contents <- readFile file
        let lines = words contents
        

        -- I'm learning soo expect a ton of comments explaining functions and lines
        -- Is a reduce funciton in simple words, takes the thing you want to accumulatea
        -- which will be of the returning type that you want, and the function reducer
        -- which in here is the query_concatenator, which it will pass trough the lines, until
        -- no more values, can be iterate over it
        --
        -- Imagine it like [] and "" are the initial values, and the fold function, will
        -- take those initial values and pass the function trough the list once, while 
        -- the value of the function will be saved on the selected variables, and that for the next
        -- lines value and soo on
        --
        -- I'm bad asf explaining, but meh
        let (queries, _) = foldl (\(accQueries, currentQuery)  line ->
                             query_concatenator line null_val currentQuery accQueries
                         ) ([], "") lines
        return queries 


query_concatenator :: String -> String -> String -> [String] -> ([String], String)
query_concatenator line null_val currentQuery completedQueries =
  if isSuffixOf null_val line
    then 
      let fullQuery = currentQuery ++ line
      in (completedQueries ++ [fullQuery], "")
    else 
      let newCurrent = currentQuery ++ line ++ " "
      in (completedQueries, newCurrent)
