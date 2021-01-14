module Parameterized where

import Data.List (sortBy)

data Person o = Person
  { personFirstName :: String
  , personLastName :: String
  , personEmail :: String
  , personAge :: Int
  , personOccupation :: o
  }

data Occupation = Lawyer | Doctor | Engineer

person1 :: Person String
person1 = Person "Michael" "Smith" "msmith@gmail.com" 27 "Lawyer"

person2 :: Person Occupation
person2 = Person "Katie" "Johnson" "kjohnson@gmail.com" 26 Doctor

salesMessage :: Person Occupation -> String
salesMessage p = case personOccupation p of
  Lawyer -> "We'll get you the settlement you deserve"
  Doctor -> "We'll get you the care you need"
  Engineer -> "We'll build that app for you"

fullName :: Person o -> String
fullName p = personFirstName p ++ " " ++ personLastName p

sortOnOcc :: (Ord o) => [Person o] -> [Person o]
sortOnOcc = sortBy (\p1 p2 -> compare (personOccupation p1) (personOccupation p2))
