class Person(object):

  def __init__(self, fn=None, ln=None, em=None, age=None, occ=None):
    self.firstName = fn
    self.lastName = ln
    self.email = em
    self.age = age
    self.occupation = occ

if __name__ == "__main__":
  p = Person("Jane", "Doe", "jane.doe@gmail.com", 35, "Project Manager")
  print(p.occupation)
  p.occupation = "Police Officer"
  print(p.occupation)
