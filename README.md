# HaskellData

This is the companion Github repository for the [Haskell Data Series](https://www.mmhaskell.com/haskell-data) on Monday Morning Haskell! This series compares the basic construction of data types in Haskell, Java, and Python, so it has code samples in all three languares:

1. [Haskell Code](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell)
2. [Java Code](https://github.com/MondayMorningHaskell/HaskellData/blob/master/java)
3. [Python Code](https://github.com/MondayMorningHaskell/HaskellData/blob/master/python)

## Running the Code

The code samples are fairly simple and easy to run, assuming you have the basic programs installed for each language.

### Running Haskell Code

Start by building the repository and loading up GHCI:

```bash
>> stack build
>> stack ghci
```

Then within GHCI, you can explore any of the individual modules. Since there are some overlapping types between the modules, you should first use the command `:load`, and then you can load a single module. You are then free to .

```bash
> :load
> import Basic
> firstPerson
SimplePerson "Michael" "Smith" "msmith@gmail.com" 32 "Lawyer"
```

If you change any of the elements in the module, or add your own, you can also reload with `:r`

```bash
> :r
> firstPerson
SimplePerson "Mike" "Smith" "msmith@gmail.com" 32 "Lawyer"
```

### Running Java Code

The Java code modules are all written such that you can run each one's `main` function as an executable. So given the source code:

```java
public class Basic {
  public static void main(String[] args) {
    Person p = new Person("Jane", "Doe", "jane.doe@gmail.com", 35, "Project Manager");
    System.out.println(p.getLastName());
  }
}
```

You can see the output like so:

```bash
>> cd java
>> java Basic.java
Doe
```

### Running Python Code

The Python code works in much the same way as the Java code. Note though, that it uses Python3. Some of the code is incompatible with Python2.

```bash
>> cd python
>> python3 Basic.py
```

You can modify the "if name = main" portion and provide new definitions if you want above it:

```python
if __name__ == "__main__":
  p = Person("Jane", "Doe", "jane.doe@gmail.com", 35, "Project Manager")
  print(p.occupation)
```

## Code Samples by Article

### [Part 1: Basics](https://www.mmhaskell.com/haskell-data/basics)

* [Haskell](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell/Basic.hs)
* [Java](https://github.com/MondayMorningHaskell/HaskellData/blob/master/java/Basic.java)
* [Python](https://github.com/MondayMorningHaskell/HaskellData/blob/master/python/Basic.py)

### [Part 2: Sum Types](https://www.mmhaskell.com/haskell-data/sum-types)

* [Haskell](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell/Multi.hs)
* [Java](https://github.com/MondayMorningHaskell/HaskellData/blob/master/java/Multi.java)
* [Python](https://github.com/MondayMorningHaskell/HaskellData/blob/master/python/Multi.py)

### [Part 3: Parameterized Types](https://www.mmhaskell.com/haskell-data/parameterized)

* [Haskell](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell/Parameterized.hs)
* [Java](https://github.com/MondayMorningHaskell/HaskellData/blob/master/java/Parameterized.java)
* [Python](https://github.com/MondayMorningHaskell/HaskellData/blob/master/python/Parameterized.py)

### [Part 4: Inheritance and Typeclasses](https://www.mmhaskell.com/haskell-data/inheritance)

* [Haskell](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell/Inheritance.hs)
* [Java](https://github.com/MondayMorningHaskell/HaskellData/blob/master/java/Inheritance.java)
* [Python](https://github.com/MondayMorningHaskell/HaskellData/blob/master/python/Inheritance.py)

### [Part 5: Type Families](https://www.mmhaskell.com/haskell-data/type-families)

* [Haskell](https://github.com/MondayMorningHaskell/HaskellData/blob/master/haskell/Inheritance.hs)
