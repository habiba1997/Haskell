# Haskell

## GHCup
GHCup is a universal installer for Haskell that will install everything you need to program in Haskell, and will help you manage those installations (update, switch versions, …). 

## Cabal or Stack 
Both are Haskell build tools. Used to structure your Haskell projects, build them, run them, define dependencies, … .They handle the management of your toolchain (including GHC — the Glasgow Haskell Compiler — and, for Windows users, MSYS2), building and registering libraries, building build tool dependencies, and more.
Stack is just an alternative to Cabal.


### Steps For Learning Haskell
1. [Installation and Getting Started on Windows](https://www.youtube.com/watch?v=gLr2u6CjSsM)
2. [Haskell Documentation](https://www.haskell.org/)
3. [Hasekll Ghcup user guide](https://www.haskell.org/ghcup/)
4. [IntelliJ plugin for Haskell](https://github.com/rikvdkleij/intellij-haskell#installing-the-plugin)
5. [Vscode Debug plugin for Haskell](https://github.com/phoityne/hdx4vsc/tree/master)
6. [Basic Tutorial](https://www.youtube.com/watch?v=02_H3LjqMr8) 
7. [Haskell Beginner Course 2022](https://youtube.com/playlist?list=PLOJjn67NeYg9cWA4hyIWcxfaeX64pwo1c) 
8. [Course and Documentation for beginners](https://github.com/haskell-beginners-2022/course-plan?tab=readme-ov-file)
9. [Get the hang of language by solving HackerRank Problems using Haskell](https://www.youtube.com/playlist?list=PLguYJK7ydFE4aS8fq4D6DqjF6qsysxTnx) 
10. [Create Minimal Servant server (check Haskel-Cabal-Minimal-Server-Project Markdown file)](https://www.youtube.com/watch?v=YYmxAHWrFR4&t=10s)
11. [Building a REST API with Haskell](https://dev.to/fabianveal/building-a-rest-api-with-haskell-2d54#resume-of-how-to-use-the-functors-and-applicatives)
12. [Cabal vs Stack (Important to Read)](https://gist.github.com/merijn/8152d561fb8b011f9313c48d876ceb07)
13. [Hoogle: Search engine](https://hoogle.haskell.org/)
14. [Stack Documentation](https://github.com/commercialhaskell/stack/blob/master/doc/GUIDE.md#external-dependencies)
15. [Another More theorized Haskell Course - Part 1]()
16. [Another More theorized Haskell Course - Part 2]()

## Course Recommended
[Haskell and Functional Programming course for complete beginners](https://github.com/haskell-beginners-2022/course-plan?tab=readme-ov-file)


## GHCi 
is an interactive environments used for developing and testing Haskell code.

## GHCi (Glasgow Haskell Compiler interactive):
GHCi is an interactive command-line interface for Haskell.
It allows you to load Haskell modules, evaluate expressions, and interactively test and debug Haskell code.
You can start GHCi by running the ghci command in your terminal.
```
ghci
```
or 
```
stack repl
```
Once inside GHCi, you can load Haskell modules using the `:load` or `:l` command, evaluate expressions, define functions, and more.

GHCi is a part of the GHC (Glasgow Haskell Compiler) toolchain, which is one of the most widely used Haskell compilers.

#### Stack REPL (Read-Eval-Print Loop):
Stack REPL is an interactive environment similar to GHCi but is integrated with the Stack build system.
It provides all the features of GHCi along with additional features such as managing project dependencies, building project-specific configurations, and ensuring reproducible builds.
You can start Stack REPL by running the `stack repl` command in your terminal within a Stack-managed Haskell project directory.
Stack REPL <b> loads your project's dependencies </b>  and provides an environment where you can interactively work with your project's code.

- Both GHCi and Stack REPL are useful tools for Haskell development, offering interactive environments for testing and exploring Haskell code. The choice between them often depends on the specific needs of your project and your familiarity with the Haskell ecosystem.


## Hoogle 
Hoogle is a Haskell API search engine, which allows you to search the Haskell libraries on Stackage by either function name, or by approximate type signature.


## Interactive commands (ghci)

- `:info` is a GHCi command that provides information about a type, class, or function in Haskell.

- `:t` is a GHCi command that shows the type of an expression or function in Haskell.

- `:l {{filaneme}}` us a GHCi command that load a a file into ghci

- `:cd ` change directory inside the ghci

- `:q` quit the ghci


## Haskell Debugging 
Check this [haskell debugging on stack](https://stackoverflow.com/questions/48208827/haskell-debug-plugin-in-intellij)

![Debugging](/images/debug.png)


## Leanring Curve
[Programming language learning curve](https://github.com/Dobiasd/articles/blob/master/programming_language_learning_curves.md)
![alt text](/images/haskell.png)


## Haskell OOP Paradigm 
In Haskell, while it doesn't strictly adhere to the object-oriented programming (OOP) paradigm, it provides constructs to achieve similar goals through different mechanisms => Data, Instance, and Class:

### Data:
In Haskell, the data keyword is used to define new algebraic data types.
A data type (Product or Sum Type) declaration specifies the structure of a new type by listing its constructors and their types.
Constructors are like functions that build values of the new type.
For example:

```haskell
data Person = Person String Int
```
Here, Person is a new data type with a constructor of the same name. It takes a String (name) and an Int (age) as parameters.

### Class:
In Haskell, a "class" refers to a type class.
Type classes define a set of functions that types must implement.
When a type implements the functions specified by a type class, it is said to be an instance of that type class.
Type classes provide a way to achieve ad-hoc polymorphism in Haskell. For example:

```haskell
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
```

Here, Eq is a type class with two methods == and /=. Types that implement these methods can be compared for equality meaning can use `==` or `/=` to compare them.

### Instance:
In Haskell, an "instance" typically refers to type class instances.
Haskell's type classes provide a way to define interfaces or behaviors that types can implement.
An instance declaration is used to specify how a particular type implements the functions defined in a type class.
For example:

```haskell
-- Define an instance of the `Eq` type class for `Person`
instance Eq Person where
    -- Define the equality operator `(==)` for `Person`
    -- It takes two `Person` values and checks if their name and age attributes are equal.
    (Person name1 age1) == (Person name2 age2) = (name1 == name2) && (age1 == age2)
```

```haskell
john = Person "John" 30
jane = Person "Jane" 25
john2 = Person "John" 30

-- Comparing persons for equality
print $ john == jane  -- False
print $ john == john2 -- True
```

Here, Eq is a type class that defines a method `==` for equating values. We're defining an instance of Eq for the Person type. In the instance declaration, we implement the `(==)` function, which checks if two `Person` values are equal based on their name and age attributes. If both the name and age are equal, the `Person` values are considered equal.

In summary, in Haskell:

- Data defines new types and their constructors.
- Instance declarations specify how types implement functions defined in type classes.
- Class declarations define type classes, which are interfaces specifying functions that types must implement to be instances of the class.

These concepts provide a way to achieve abstraction, polymorphism, and encapsulation in Haskell, similar to OOP principles but with a different syntax and underlying mechanisms.

![dataVsIntstanceVsClass](/images/data_Vs_class_Vs_instance.png)


