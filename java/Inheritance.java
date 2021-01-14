public class Inheritance {
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

  public static class Employee extends Person {
    public String lastName;
    public String company;
    public String email;
    public int salary;

    public Employee(String fn,
                    String ln,
                    int age,
                    String company,
                    String em,
                    int sal) {
      super(fn, age);
      this.lastName = ln;
      this.company = company;
      this.email = em;
      this.salary = sal;
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

  public static String greet(Person p) {
    return "Hello, my name is " + p.getFullName() + ". My age is " + p.age;
  }

  public static interface PersonInterface {
    String getFullName();
  }

  public static class Adult implements PersonInterface {
    public String firstName;
    public String lastName;
    public int age;
    public String occupation;

    public Adult(String fn, String ln, int age, String occ) {
      this.firstName = fn;
      this.lastName = ln;
      this.age = age;
      this.occupation = occ;
    }

    public String getFullName() {
        return this.firstName + " " + this.lastName;
    }
  }

  public static void main(String[] args) {
    Employee e = new Employee("Michael", "Smith", 23, "Google", "msmith@google.com", 100000);
    Person p = new Person("Katie", 25);
    Child c = new Child("Kelly", 8, 2);
    Person[] people = {e, p, c};
    for (Person person : people) {
      System.out.println(greet(person));
    }

    Adult a = new Adult("Michael", "Smith", 23, "Engineer");
    PersonInterface[] people2 = {a};
    for (PersonInterface person : people2) {
      System.out.println(person.getFullName());
    }
  }
}
