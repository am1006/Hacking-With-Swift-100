import SwiftUI

/**
 # Day 11 - Protocols, extensions, and Protocol Extensions
 */

/**
 ## Protocols
 
 Protocols are a way of describing **what properties and methods something must have**.
 
 You then tell Swift which types use that protocol – a process known as *adopting* or *conforming* to a protocol.
 */

/// For example, we can write a function that accepts something with an `id` property, but we don’t care precisely what type of data is used. We’ll start by creating an `Identifiable` protocol, which will require all conforming types to have an `id` string that can be read (“get”) or written (“set”):

protocol Identifiable {
    var id: String { get set }
    func identity()
}

/// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly. But we can create a struct that conforms to it:


struct User: Identifiable {
    func identity() {
        print("My ID is \(self.id)")
    }
    
    var id: String
}

/// Finally, we’ll write a function that accepts **any** `Identifiable` object:

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id).")
}

/**
 ## Protocol inheritance
 
 One protocol can inherit from another in a process known as protocol inheritance.
 
 Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.
 */

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

/// We can now create a single Employee protocol that brings them together in one protocol.

protocol Employee: Payable, NeedsTraining, HasVacation {}

/**
 ## Extensions
 
 Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.
 */

/// For example, let's extend `Int`
extension Int {
    func squared() -> Int {
        return self * self
    }
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 8
number.squared()

/// Notice: Swift doesn’t let you add **stored properties** in extensions, so you must use computed properties instead.
/// `isEven` is an example of this.

/**
 ## Protocol extensions
 
 __Protocols__ let you describe what methods something should have, but don’t provide the code inside.
 
 __Extensions__ let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.

 __Protocol extensions__ solve both those problems: they are like regular extensions, except rather than extending a specific type like `Int` you extend a whole protocol **so that all conforming types get your changes**.
 */

/// Swift’s arrays and sets both conform to a protocol called `Collection`
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarise() {
        print("In \(self), There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarise()
beatles.summarise()

/**
 ## Protocol-oriented Programming (POP)
 
 i.e., crafting your code around protocols and protocol extensions.
 
 Based on: Protocol extensions can provide __default implementations__ for our own protocol methods.
 
 
 Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 
 How is protocol-oriented programming different from object-oriented programming?
 https://www.hackingwithswift.com/quick-start/understanding-swift/how-is-protocol-oriented-programming-different-from-object-oriented-programming
 
 WWDC Video: https://developer.apple.com/videos/play/wwdc2015/408/
 */

/// Recall our `Identifiable` protocol, we could make every conforming type write their own `identify()` method, but protocol extensions allow us to provide a default:

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

/// Now when we create a type that conforms to Identifiable it gets `identify()` automatically:

struct Buyer: Identifiable {
    
    /// I don't know why we still need this...
    func identity() {}
    
    var id: String
}

let mickey = Buyer(id: "Mickey Mouse")
mickey.identify()
