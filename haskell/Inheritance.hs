module Inheritance where

class Person a where
  firstName :: a -> String
  age :: a -> Int
  getFullName :: a -> String

data Employee = Employee
  { employeeFirstName :: String
  , employeeLastName :: String
  , employeeAge :: Int
  , company :: String
  , email :: String
  , salary :: Int
  }

instance Person Employee where
  firstName = employeeFirstName
  age = employeeAge
  getFullName e = employeeFirstName e ++ " " ++ employeeLastName e

data Child = Child
  { childFirstName :: String
  , childAge :: Int
  , childGrade :: Int
  }

instance Person Child where
  firstName = childFirstName
  age = childAge
  getFullName = childFirstName

greet :: (Person p) => p -> String
greet person = "Hello, my name is " ++ getFullName person ++
  ". My age is " ++ show (age person)

adult :: Employee
adult = Employee "Michael" "Smith" 32 "Agee, Poe & Epps" "msmith@gmail.com" 150000

child :: Child
child = Child "Kelly" 8 2

adultGreeting :: String
adultGreeting = greet adult

childGreeting :: String
childGreeting = greet child

data Person2 = Person2
  { firstName' :: String
  , age' :: Int
  }

data Employee2 = Employee2
  { employeePerson :: Person2
  , lastName' :: String
  , company' :: String
  , email' :: String
  , salary' :: Int
  }

data Child2 = Child2
  { childPerson :: Person2
  , grade' :: Int
  }

adult2 :: Employee2
adult2 = Employee2 (Person2 "Michael" 32) "Smith" "Agee, Poe & Epps" "msmith@gmail.com" 150000

child2 :: Child2
child2 = Child2 (Person2 "Kelly" 8) 2
