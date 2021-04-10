--  Smallest k sets - Lab assignment 1
--  
--  Author: David Söderberg

-- <<< SUBLIST BUILDING FUNCTIONS START >>>
-- returnSublist returns a quadruple, (a,b,c,d), where a=[i .. j], b=i, c=j and d=sum[i .. j]
returnSublist :: [Int] -> Int -> Int -> (Int, Int, Int, [Int])
returnSublist lst i j = (sum [lst !! (n-1) | n <- [i .. j]], i, j, [lst !! (n-1) | n <- [i .. j]])

-- iterateSublists returns ALL sublists from index 1 to j, where j will be length of the input list
-- it makes use of the function 
iterateSublists :: [Int] -> Int -> [(Int, Int, Int, [Int])]
iterateSublists lst j
  | j > 1 = [(returnSublist lst i j) | i <- [1 .. j]] ++ iterateSublists lst (j-1)
  | otherwise = [(returnSublist lst j j)]

-- This function ties up most of the functions to be used together and returns
-- returnKSmallestSublists returns the k smallest sublists from the list
returnKSmallestSublists :: [Int] -> Int -> [(Int, Int, Int, [Int])]
returnKSmallestSublists lst k = take k . sortSublists . iterateSublists lst $ length lst
-- <<< SUBLIST BUILDING FUNCTIONS END >>>


-- << MAIN FUNCTION THAT TIES EVERYTHING TOGETHER START >>
-- smallestKSets is the main function, it ties everything together and
-- is the function that prints the k smallest sets
smallestKSets :: [Int] -> Int -> IO()
smallestKSets [] _ = error "Empty list, does not work on empty lists"
smallestKSets lst k 
  | k > 0     = putStr (entireListToString lst ++ (toStringSublists (returnKSmallestSublists lst k)))
  | otherwise = error "K must be greater than 0"
-- << MAIN FUNCTION THAT TIES EVERYTHING TOGETHER END >>


-- <<< PRINT/STRING FUNCTION START >>>
-- Not necessary at all for the lab, but thought it would be fun to do.
-- entireListToString 
entireListToString :: [Int] -> String
entireListToString lst = "Entire list: [" ++ listToString lst ++ "]\n\nsize\ti\tj\tsize\n"

-- listToString turns an list of integers and makes it into a string
-- with a ',' as a delimitor
listToString :: [Int] -> String
listToString (x:xs)
  | xs == [] = show x
  | otherwise = show x ++ "," ++ listToString xs

-- toStringSublists turns all sublists in a list into a string,
-- with newline as a delimitor
toStringSublists :: [(Int, Int, Int, [Int])] -> String
toStringSublists [] = []
toStringSublists (x:xs) = toStringSublist x ++ "\n" ++ toStringSublists xs

-- toStringSublist turns a sublist into a string
toStringSublist :: (Int, Int, Int, [Int]) -> String
toStringSublist (size, i, j, lst) = show size ++ "\t" ++ show i ++ "\t" ++ show j ++ "\t" ++ show lst
-- <<< PRINT/STRING FUNCTION END >>>


-- <<< SORTING FUNCTIONS START >>>
-- Inserts the sublist in a list in the correct place in an ascending order
insertIntoList :: (Int, Int, Int, [Int]) -> [(Int, Int, Int, [Int])] -> [(Int, Int, Int, [Int])]
insertIntoList x [] = [x]
insertIntoList (size, i, j, lst) ((hsize, hi, hj, hlst) : rest) 
    | size <= hsize = (size, i, j, lst) : (hsize, hi, hj, hlst) : rest
    | otherwise = (hsize, hi, hj, hlst) : insertIntoList (size, i, j, lst) rest

-- Makes use of insertIntoList to sort a list with the help of recursion and
-- inserting all elements from the original list into an empty one, one by one.
sortSublists :: [(Int, Int, Int, [Int])] -> [(Int, Int, Int, [Int])]
sortSublists [] = []
sortSublists (x:xs) = insertIntoList x (sortSublists xs)
-- <<< SORTING FUNCTIONS END >>>


--  Entire list: [-1,2,-3,4,-5], k=3
--
--  size i j sublist
--    -5 5 5 [-5]
--    -4 3 5 [-3,4,-5]
--    -3 3 3 [-3]
--  
--  whereas all lists are:
--  size i j sublist
--    -1 1 1 [-1]
--     1 1 2 [-1,2]
--    -2 1 3 [-1,2,-3]
--     2 1 4 [-1,2,-3,4]
--    -3 1 5 [-1,2,-3,4,-5]
--     2 2 2 [2]
--    -1 2 3 [2,-3]
--     3 2 4 [2,-3,4]
--    -2 2 5 [2,-3,4,-5]
--    -3 3 3 [-3]
--     1 3 4 [-3,4]
--    -4 3 5 [-3,4,-5]
--     4 4 4 [4]
--    -1 4 5 [4,-5]
--    -5 5 5 [-5]
-- list of allowed functions
-- Basic things such as types, t.ex Int, Bool, Guards osv
-- length, :, ++, !!, concat, head, last, tail, init, replicate, take, drop, splitAt,
-- reverse, zip, unzip, and, or, sum, product
-- map, filter, foldr
-- putStr
-- show (unsure, but hopefully)