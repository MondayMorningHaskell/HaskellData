class Person(object):

  # This definition hasn't changed from part 1!
  def __init__(self, fn, ln, em, age, occ):
    self.firstName = fn
    self.lastName = ln
    self.email = em
    self.age = age
    self.occupation = occ

class Occupation(object):
  def __init__(self, name, location):
    self.name = name
    self.location = location


if __name__ == "__main__":
  stringOcc = "Lawyer"
  person1 = Person(
      "Michael",
      "Smith",
      "msmith@gmail.com",
      27,
      stringOcc)

  classOcc = Occupation("Software Engineer", "San Francisco")

  # Still works!
  person2 = Person(
    "Katie",
    "Johnson",
    "kjohnson@gmail.com",
    26,
    classOcc)

  people = [person1, person2]
  for p in people:
    # This works. Both types of occupations are printable.
    print(p.occupation)

    # This won't work. Our "Occupation" class
    # doesn't work with "len"
    # print(len(p.occupation))
