import SwiftUI

/**
# Day 06 - Closures, part one
*/

/**
 ## Creating basic closures
*/

// functions in swift: first class citizen

let driving = {
    print("I'm driving a car.")
}

driving // this is a function
driving() // this is the result that's from evalutating the function

/**
## Accepting parameters in a closure
*/

// __Accept__ !

let drivingTo = { (place: String) in
    print("I'm driving to \(place) now")
}

drivingTo("London")

/**
## returning values from a closure
*/

let destination = { (place: String) -> String in
    return "I'm driving to \(place) now"
}

print(destination("London"))

/**
# Closure as parameters
 
 Remember, in swift, functions are first class citizens.
 
 If we wanted to pass that closure into a function **so it can be run inside that function**, we would specify the parameter type as `() -> Void`. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.
 
 Why? Take a loot at [this](https://www.hackingwithswift.com/quick-start/understanding-swift/why-would-you-want-to-use-closures-as-parameters ) -- almost like a callback function. (async)
*/

func travel(action: () -> Void) {
    print("I'm ready to go")
    action()
    print("I arrived")
}

travel(action: driving)

/**
 ## Trailing closure syntax
 
 Why using this? https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-trailing-closure-syntax
 
 If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
 
 Cecause there aren’t any other parameters, we can eliminate the parentheses entirely:
 */
travel {
    print("I'm driving another car")
}

/**
# Day 07 - Closures, part two
*/

/**
 # Using closures as parameters when they accept parameters
 */

func travelTo(action: (String) -> Void) {
    print("I'm ready to go")
    action("London")
    print("I arrived")
}

travelTo(action: drivingTo)
//Now when we call travel() using trailing closure syntax, our closure code is required to accept a string:

travelTo { (place: String) in
    print("I'm going to \(place) in my car")
}

/**
 # Using closures as parameters when they return values
 
 
 */
func describeTravelTo(action: (String) -> String) {
    print("I'm ready to go")
    let description = action("London")
    print(description)
    print("I arrived")
}

describeTravelTo(action: destination)

describeTravelTo { (place: String) -> String in
        return "I'm driving to \(place) now"
}

/**
 # Shorthand parameter names
 
 Let's take a look at `describeTravelTo` again. Swift actually knows the parameter to that closure must be a string, so we can remove it
 */
describeTravelTo { place -> String in
        return "I'm driving to \(place) now"
}
/// It also knows the closure must return a string, so we can remove that too:
describeTravelTo { place in
    return "I'm driving to \(place) now"
}
/// As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too (evalutation, rather than statement):
describeTravelTo { place in
    "I'm driving to \(place) now"
}
/// Even more, Swift has a shorthand syntax that lets you go even shorter.
/// We can let Swift provide automatic names for the closure’s parameters. These are named with a dollar (`$`) sign, then a number counting from 0.
describeTravelTo {
    "I'm driving to \($0) now"
}

/**
 # Closures with multiple parameters
 */

func travelToWithSpeed(action: (String, Int) -> String) {
    print("I'm ready to go")
    let description = action("London", 60)
    print(description)
    print("I arrived")
}

travelToWithSpeed {
    "I'm going to \($0) at \($1) miles per hour."
}

/**
 # Returning closures from functions
 */

func travelReturnclosure() -> ((String) -> Void) {
    return {
        print("I'm going to \($0)")
    }
}

let result = travelReturnclosure()
result("London")

travelReturnclosure()("London")

/**
 # Capturing values
 
 The key difference between annoymous functions and closures.
 
 If you use any external values inside your closure, Swift captures them – **stores them alongside the closure**, so they can be modified even if they don’t exist any more.
 
 Hey, here's the real power: https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-swifts-closures-capture-values
 */
func travelCapture() -> (String) -> Void {
    var counter = 1

    // counter is outsite this closure
    // but it's been used within this closure
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let resultNoticeCounter = travelCapture() /// I got a closure instance - `counter` will be kept within this closure.
resultNoticeCounter("London")
resultNoticeCounter("London")
resultNoticeCounter("London")



/**
 http://goshdarnclosuresyntax.com/
 */
