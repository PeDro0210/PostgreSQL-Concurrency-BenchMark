module Parsers.Utils.ListManipulation where

deleteLastElement :: [a] -> [a]
deleteLastElement [] = error "Empty list!"
deleteLastElement [h] = []
deleteLastElement (h : t) = h : deleteLastElement t
