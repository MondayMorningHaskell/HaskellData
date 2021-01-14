public class Basic {
  public static class Person {
      private String firstName;
      private String lastName;
      private String email;
      private int age;
      private String occupation;
      
      public Person(String fn, 
                         String ln, 
                         String em,
                         int age,
                         String occ) {
          this.firstName = fn;
          this.lastName = ln;
          this.email = em;
          this.age = age;
          this.occupation = occ;
      }

    public String getFirstName() { return this.firstName; }
    public String getLastName() { return this.lastName; }
    public String getEmail() { return this.email; }
    public int getAge() { return this.age; }
    public String getOccupation() { return this.occupation; }

    public void setFirstName(String fn) { this.firstName = fn; }
    public void setLastName(String ln) { this.lastName = ln; }
    public void setEmail(String em) { this.email = em; }
    public void setAge(int age) { this.age = age; }
    public void setOccupation(String occ) { this.occupation = occ; }
  }

  public static void main(String[] args) {
    Person p = new Person("Jane", "Doe", "jane.doe@gmail.com", 35, "Project Manager");
    System.out.println(p.getLastName());
    p.setLastName("Washington");
    System.out.println(p.getLastName());
  }
}
