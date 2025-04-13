module Parsers.SqlParser where

import Data.List (isSuffixOf)

parser :: String -> String -> IO [[String]]
parser file null_val = do
  contents <- readFile file
  let lines = words contents

  let (_, _, query_list) =
        foldl
          ( \(actualQuery, actualQueryFamily, queriesFamily) line ->
              queryConcatenator line null_val actualQuery actualQueryFamily queriesFamily
          )
          ("", [], [])
          lines
  return query_list

queryConcatenator :: String -> String -> String -> [String] -> [[String]] -> (String, [String], [[String]])
queryConcatenator -- ngl, like the way the hsl refactors code
  line
  null_val
  currentQuery
  currentQueryFamily
  completedQueriesFamily
    | null_val `isSuffixOf` line -- pattern for the null_val (separator)
      =
        ( "",
          currentQueryFamily,
          completedQueriesFamily ++ [currentQueryFamily] -- appends to the family
        )
    | ";" `isSuffixOf` line -- for setting end of a query
      =
        let fullQuery = currentQuery ++ line
         in ("", currentQueryFamily ++ [fullQuery], completedQueriesFamily)
    | otherwise -- self-explanatory asf
      =
        let newCurrent = currentQuery ++ line ++ " "
         in (newCurrent, currentQueryFamily, completedQueriesFamily)
