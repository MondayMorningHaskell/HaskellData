class MultiPerson():
  def __init__(self,
               fn = None,
               ln = None,
               em = None,
               age = None,
               occ = None,
               grade = None):
    if fn and ln and em and age and occ:
      self.isAdult = True
      self.firstName = fn
      self.lastName = ln
      self.age = age
      self.occupation = occ
      self.grade = None
    elif fn and age and grade:
      self.isAdult = False
      self.firstName = fn
      self.age = age
      self.grade = grade
      self.lastName = None
      self.email = None
      self.occupation = None
    else:
      raise ValueError("Failed to construct a MultiPerson!")

  def getFullName(self):
    if self.isAdult:
      return self.firstName + " " + self.lastName
    else:
      return self.firstName

class Person():
  def __init__(self, fn, age):
    self.firstName = fn
    self.age = age

  def getFullName(self):
    return self.firstName

class Adult(Person):
  def __init__(self, fn, ln, em, age, occ):
    super().__init__(fn, age)
    self.lastName = ln
    self.email = em
    self.occupation = occ

  def getFullName(self):
    return self.firstName + " " + self.lastName

class Child(Person):
  def __init__(self, fn, age, grade):
    super().__init__(fn, age)
    self.grade = grade

if __name__ == "__main__":
  # Note which arguments we use!
  adult = MultiPerson(fn="Michael", ln="Smith", em="msmith@gmail.com", age=25, occ="Lawyer")
  child = MultiPerson(fn="Mike", age=12, grade=7)
  print(adult.getFullName())
  print(child.getFullName())

  adult2 = Adult("Michael", "Smith", "msmith@gmail.com", 25, "Lawyer")
  child2 = Child("Mike", 12, 7)
  print(adult2.getFullName())
  print(child2.getFullName())
