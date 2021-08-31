import SwiftUI

/**
 # Day 08 - Structs Part 1 (properties, and methods)
 
 Structs let us create our own data types out of several small types. For example, you might put three strings and a boolean together and say that represents a user in your app.
 
 */

/**
 ## Creating your own Structs
 
 Swift lets you design your own types in two ways, of which the most common are called structures, or just *structs*.
 
 Another? classes!
 
 Structs can be given their own **variables** and **constants**, and **their own functions**, then created and used however you want.
 */

/// Variables inside structs are called *properties*
struct Sport {
    var name: String
}

/// we can create and use an **instance** of it:
var tennis = Sport(name: "Tennis")
print(tennis.name)

/// **We made both name and tennis variable**, so we can change them just like regular variables:
tennis.name = "Lawn tennis"

/// Difference between a struct and a tuple: https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-difference-between-a-struct-and-a-tuple
/// TLDR:  a tuple is effectively just a struct without a name, like an anonymous struct. However, tuples are annoying to use again and again.


/**
 ## Computed properties
 
 Previously: stored properties
 
 Swift has a different kind of property called a computed property – a property that runs code to figure out its value.
 
 (Using a stored property will be much faster than using a computed property)
 
 Lazy properties help mitigate the performance issues of rarely read stored properties, and property observers mitigate the dependency problems of stored properties – we’ll be looking at them soon.
 */
struct SportLevel2 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
    // can we use ternary operator here?
}

let chessBoxing = SportLevel2(name: "ChessBoxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

/**
 ## Property observers
 
 Property observers let you run code before or after any property changes.
 
 Before: `willSet` property (in practice it is significantly less popular)
 After: `didSet` property (most of time)
 */

struct Progress {
    var task : String
    var amount : Int {
        didSet {
            print("\(task) is now \(amount)")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

/**
 ## Methods
 
 Functions inside structs are called methods, but they still use the same `func` keyword.
 */

struct City {
    var population : Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

/**
 ## Mutating methods
 
 If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the instance of the struct is constant, so all its properties are also constant regardless of how they were created.
 
 The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties (i.e., Swift ensures side effect free) unless you specifically request it.

 When you want to change a property inside a method, you need to mark it using the `mutating` keyword.
 
 
 There are two important details you’ll find useful:

 - Marking methods as `mutating` will stop the method from being called on constant structs, even if the method itself doesn’t actually change any properties. If you say it changes stuff, Swift believes you!
 - A method that is not marked as `mutating` cannot call a mutating function – you must mark them both as mutating.
 
 */

struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var leo = Person(name: "Leo")
leo.makeAnonymous()

/**
 ## Properties and methods of strings

 We’ve used lots of strings so far, and it turns out they are structs – they have their own methods and properties we can use to query and manipulate the string.
 
 (Almost all of Swift’s core types are implemented as structs, including strings, integers, arrays, dictionaries, and even Booleans. )
 */

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

/**
 ## Properties and methods of arrays
 
 Read this: https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-strings-behave-differently-from-arrays-in-swift
 
 (Strings vs Arrays in Swift: performance and differences)
 */
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
toys.sorted()
toys.remove(at: 0)


/**
 # Day 09 - Structs Part 2
 */

/**
 ## Initializers
 
 Initializers are special methods that provide different ways to create your struct.
 
 All structs come with one by default, called their **memberwise initializer** – this asks you to provide a value for each property when you create the struct.
 
 From this (article)[https://www.hackingwithswift.com/quick-start/understanding-swift/how-do-swifts-memberwise-initializers-work]:
 - By default, all Swift structs get a synthesized memberwise initializer by default, which means that we automatically get an initializer that accepts values for each of the struct’s properties.
 -  if any of your properties have default values, then they’ll be incorporated into the initializer as default parameter values. So, if I make a struct like this:
 - The second clever thing Swift does is remove the memberwise initializer if you create an initializer of your own.
 
 */

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()

/// So, as soon as you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an `extension`, like this:

struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")


/**
 ## `self` keyword - referring to the current instance

 Just like `this` in Java.
 
 And:
    Outside of initializers, the main reason for using self is because we’re in a closure and Swift requires us to so we’re making it clear we understand what’s happening.
 
 (https://www.hackingwithswift.com/quick-start/understanding-swift/when-would-you-use-self-in-a-method)
 */

struct Person1 {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person1 = Person1(name: "Leo")

/**
 # Lazy properties
 
 As a performance optimization, Swift lets you create some properties only when they are needed.

 */

/// consider this `FamilyTree` struct – it doesn’t do much, but _in theory_ creating a family tree for someone takes a long time:

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}


/// If we add the `lazy` keyword to the familyTree property, then Swift will only create the FamilyTree struct **when it’s first accessed**:

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

/**
 Extenstion for Lazy:
 https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-properties-be-lazy
 
 Swift’s lazy properties let us delay the creation of a property until it’s actually used, which makes them like a computed property.
 
 However, _unlike_ a computed property, Lazy Properties store the result that gets calculated, so that subsequent accesses to the property don’t redo the work. (Recall that computed property needs to be computed each time we use it)
 
 However, that doesn’t mean we should make every property lazy, or indeed **most** properties – in practice, the **majority** of properties are just standard stored properties.
 
 There are a few reasons. Read them if you forgot.
 */


/**
 ## Static properties and methods
 
 All the properties and methods we’ve created so far have belonged to individual instances of structs.

 */

/// You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as `static`.

/// Please notice that, in Java, non-static variable cannot be referenced from a static context <-> static variables can be referenced from a non-static context

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        // notice that we need to read it using the class name
        Student.classSize += 1
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

/**
 ## Access control
 
 Access control lets you restrict which code can use properties and methods.
 
 */

struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My ID is \(id)"
    }
}

let jee = Person3(id: "12345").identify()
