public class Multi {
  public static class MultiPerson {
    public boolean isAdult;
    public String adultFirstName;
    public String adultLastName;
    public String adultEmail;
    public int adultAge;
    public String adultOccupation;
    public String childFirstName;
    public int childAge;
    public int childGrade;

    // Adult Constructor
    public MultiPerson(String fn, String ln, String em, int age, String occ) {
      this.isAdult = true;
      this.adultFirstName = fn;
      this.adultLastName = ln;
      this.adultEmail = em;
      this.adultAge = age;
      this.adultOccupation = occ;
    }

    // Child Constructor
    public MultiPerson(String fn, int age, int grade) {
      this.isAdult = false;
      this.childFirstName = fn;
      this.childAge = age;
      this.childGrade = grade;
    }

    public String getFullName() {
      if (this.isAdult) {
        return this.adultFirstName + " " + this.adultLastName;
      } else {
        return this.childFirstName;
      }
    }
  }

  public static class Person {
    public String firstName;
    public int age;

    public Person(String fn, int age) {
      this.firstName = fn;
      this.age = age;
    }

    public String getFullName() {
      return this.firstName;
    }
  }

  public static class Adult extends Person {
    public String lastName;
    public String email;
    public String occupation;

    public Adult(String fn, String ln, String em, int age, String occ) {
      super(fn, age);
      this.lastName = ln;
      this.email = em;
      this.occupation = occ;
    }

    public String getFullName() {
      return this.firstName + " " + this.lastName;
    }
  }

  public static class Child extends Person {
    public int grade;

    public Child(String fn, int age, int grade) {
      super(fn, age);
      this.grade = grade;
    }
  }

  public static void main(String[] args) {
    MultiPerson adult = new MultiPerson("Michael", "Smith", "msmith@gmail.com", 32, "Lawyer");
    MultiPerson child = new MultiPerson("Kelly", 8, 2);
    MultiPerson[] people = {adult, child};
    for (MultiPerson p : people) {
      System.out.println(p.getFullName());
    }

    Adult adult2 = new Adult("Michael", "Smith", "msmith@gmail.com", 32, "Lawyer");
    Child child2 = new Child("Kelly", 8, 2);
    Person[] people2 = {adult2, child2};
    for (Person p : people2) {
      System.out.println(p.getFullName());
    }
  }
}
