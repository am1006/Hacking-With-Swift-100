import SwiftUI

/**
 # Day 10 Classes and Inheritance
 
 Classes are similar to structs in that they allow you to create new types with properties and methods, but they have five important differences and I’m going to walk you through each of those differences one at a time.
 
 
 Why does Swift have both classes and structs?
 https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-both-classes-and-structs
 
 both classes and structs give us the ability to create custom, complex types with properties and methods, but they have five important differences.
 
 Most Swift developers prefer to use structs rather than classes when possible, which means **when you choose a class over a struct, you’re doing so because you want one of the above behaviors**.
 */

/**
 ## Creating your own classess (Constructor)
 
 _The first difference_ between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.
 
 - Why? See this: https://www.hackingwithswift.com/quick-start/understanding-swift/why-dont-swift-classes-have-a-memberwise-initializer
 
 Creating instances of that class looks _just the same_ as if it were a struct.
 */

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

/**
 ## Class inheritance

 _The second difference_ between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.
 */

class Poodle: Dog {
    /// For safety reasons, Swift **always** makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

/**
 ## Overriding methods
 
 Child classes can replace parent methods with their own implementations.
 */

class PoodleYip: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}
let pop = PoodleYip(name: "poppy")
pop.makeNoise()

/**
 ## Final classes

 When you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.
 
 */

final class UltimateDog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/**
 ## Copying objects
 
 _The third difference_ between classes and structs is how they are copied.
 
 When you copy a struct, both the original and the copy are different things – changing one won’t change the other. (By value)
 
 When you copy a class, both the original and the copy point to the same thing, so changing one does change the other. (By reference)
 */

class Singer {
    var name = "Tayler Swift"
}

var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

/// if Singer were a struct, then we would get “Taylor Swift” printed a second time.

/**
 ## Deinitializers

 _The fourth difference_ between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.
 
 Why do classes have deinitializers and structs don’t?
 https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-classes-have-deinitializers-and-structs-dont
 
 Structs: pass by value:  For structs this is fairly simple: the struct is destroyed when whatever owns it no longer exists. So, if we create a struct inside a method and the methods ends, the struct is destroyed.
 
 Classes: pass by reference: However, classes have complex copying behavior that means several copies of the class can exist in various parts of your program. All the copies point to the same underlying data, and so it’s now much harder to tell when the actual class instance is destroyed – when the final variable pointing to it has gone away.
 
 Behind the scenes Swift performs something called automatic reference counting, or ARC. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.
 
 So, the simple reason for why structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data, so nothing special needs to happen when it is destroyed.

 
 */

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    /// each time the loop goes around a new person will be created then destroyed:
    deinit {
        print("\(self.name) is no more existing")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

/**
 ## Mutability
 
 _The final difference_ between classes and structs is the way they deal with constants.
 
 If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.
 
 However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the `mutating` keyword with methods that change properties (side effect); that’s only needed with structs.
 
 This difference means you can change any variable property on a class even when the class is created as a constant.
 
 - Why can variable properties in constant classes be changed?
 https://www.hackingwithswift.com/quick-start/understanding-swift/why-can-variable-properties-in-constant-classes-be-changed
 
 Again, this is related to "by value" vs "by reference"

 
 */

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// If you want to stop that from happening you need to make the property constant:
/**
 ```swift
 class Singer {
     let name = "Taylor Swift"
     ^^^
 }
 ```
 */
