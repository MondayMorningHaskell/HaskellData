public class Parameterized {
  public static class Person<T> {
      private String firstName;
      private String lastName;
      private String email;
      private int age;
      private T occupation;
      
      public Person(String fn, String ln, String em, int age, T occ) {
          this.firstName = fn;
          this.lastName = ln;
          this.email = em;
          this.age = age;
          this.occupation = occ;
      }

      public T getOccupation() { return this.occupation; }
      public void setOccupation(T occ) { this.occupation = occ; }
  }

  enum Occupation {
    LAWYER,
    DOCTOR,
    ENGINEER
  }

  public static void main(String[] args) {
    Person<String> person1 = new Person<String>("Michael", "Smith", "msmith@gmail.com", 27, "Lawyer");
    System.out.println(person1.getOccupation());

    Person<Occupation> person2 = new Person<Occupation>("Katie", "Johnson", "kjohnson@gmail.com", 26, Occupation.DOCTOR);
    System.out.println(person2.getOccupation());
  }
}
