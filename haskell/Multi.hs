module Multi where

data Person =
  Adult String String String Int String |
  Child String Int Int

personAge :: Person -> Int
personAge (Adult _ _ _ a _) = a
personAge (Child _ a _) = a

-- OR
-- personAge :: Person -> Int
-- personAge p = case p of
  -- Adult _ _ _ a _ -> a
  -- Child _ a _ -> a

adult1 :: Person
adult1 = Adult "Michael" "Smith" "msmith@gmail.com" 32 "Lawyer"

child1 :: Person
child1 = Child "Kelly" 8 2

data Person2 =
  Adult2
    { adultFirstName :: String
    , adultLastName :: String
    , adultEmail :: String
    , adultAge :: Int
    , adultOccupation :: String
    } |
  Child2
    { childFirstName :: String
    , childAge :: Int
    , childGrade :: Int
    }

-- The following functions are derived from the above definition:
-- adultFirstName :: Person2 -> String
-- adultLastName :: Person2 -> String
-- adultEmail :: Person2 -> String
-- adultAge :: Person2 -> String
-- adultOccupation :: Person2 -> String
-- childFirstName :: Person2 -> String
-- childAge :: Person2 -> Int
-- childGrade :: Person2 -> Int

adult2 :: Person2
adult2 = Adult2 "Michael" "Smith" "msmith@gmail.com" 32 "Lawyer"

child2 :: Person2
child2 = Child2 "Kelly" 8 2

adult2Name :: String
adult2Name = adultFirstName adult2 ++ " " ++ adultLastName adult2

child2Name :: String
child2Name = childFirstName child2

-- These compile, but will fail at runtime!
adult2Error :: String
adult2Error = childFirstName adult2

child2Error :: String
child2Error = adultLastName child2
