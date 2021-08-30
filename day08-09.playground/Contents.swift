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
 
 The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties (i.e., side effect free) unless you specifically request it.

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
