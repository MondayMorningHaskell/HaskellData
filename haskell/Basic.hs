module Basic where

data SimplePerson = SimplePerson String String String Int String
  deriving (Show)

firstPerson :: SimplePerson
firstPerson = SimplePerson "Michael" "Smith" "msmith@gmail.com" 32 "Lawyer"

incomplete :: String -> SimplePerson
incomplete = SimplePerson "Michael" "Smith" "msmith@gmail.com" 32

complete :: SimplePerson
complete = incomplete "Firefighter"

data Person = Person
  { personFirstName :: String
  , personLastName :: String
  , personEmail :: String
  , personAge :: Int
  , personOccupation :: String
  } deriving (Show)

fullName :: Person -> String
fullName person = personFirstName person ++ " "
  ++ personLastName person

fullNameSimple :: SimplePerson -> String
fullNameSimple (SimplePerson fn ln _ _ _) = fn ++ " " ++ ln

fullName' :: Person -> String
fullName' (Person fn ln _ _ _) = fn ++ " " ++ ln
