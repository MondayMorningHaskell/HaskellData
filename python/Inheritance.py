class Person():
  def __init__(self, fn, age):
    self.firstName = fn
    self.age = age

  def getFullName(self):
    return self.firstName

class Employee(Person):
  def __init__(self, fn, ln, age, company, em, sal):
    super().__init__(fn, age)
    self.lastName = ln
    self.company = company
    self.email = em
    self.salary = sal

  def getFullName(self):
    return self.firstName + " " + self.lastName

class Child(Person):
  def __init__(self, fn, age, grade):
    super().__init__(fn, age)
    self.grade = grade

def greet(person):
  return "Hello my name is: " + person.getFullName() + ". My age is " + str(person.age)

class Adult():
  def __init__(self, fn, ln, age, occ):
    self.firstName = fn
    self.lastName = ln
    self.occupation = occ

  def getFullName(self):
    return self.firstName + " " + self.lastName

if __name__ == "__main__":
  e = Employee("Michael", "Smith", 23, "Google", "msmith@google.com", 100000)
  p = Person("Katie", 25)
  c = Child("Kelly", 8, 2)
  a = Adult("Michael", "Smith", 23, "Engineer")

  people = [e, p, c, a]
  for person in people:
    print(person.getFullName())

  # What if we added the "Adult" to this list?
  greetables = [e, p, c];
  for g in greetables:
    print(greet(g))
