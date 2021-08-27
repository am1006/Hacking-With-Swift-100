import SwiftUI

// functions

func printHelp() {
    let message = """
Welcome to My App!
    
Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}

printHelp()

// Accept parameters
func square(number : Int) {
    print(number * number)
}

square(number: 8)

// return values
//  write a dash then a right angle bracket after your function’s parameter list:
func returnSquare(number : Int) -> Int {
    return number * number
}

print(returnSquare(number: 8))

// If you need to return multiple values, this is a perfect example of when to use tuples.

// parameter labels
// Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space.

func sayHello(to name : String) {
    // externally: to
    // internally: name
    print("Hello, \(name)")
}
// This gives variables a sensible name inside the function, but means calling the function reads naturally.
sayHello(to: "leo")

// omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("Leo")
// generally it’s better to give your parameters external names to avoid confusion


// Default parameters
// You can give your own parameters a default value just by writing an = after its type followed by the default you want to give it.

func greetSafely(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello, \(person)")
    }
    else {
        print("Oh no, it's \(person) again...")
    }
}

greetSafely("Leo")
greetSafely("Leo", nicely: false)


// variadic functions
// Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type.
// for example
print("Haters", "gonna", "hate")

// You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers.
// Inside the function, Swift converts the values that were passed in __to an array of integers__, so you can loop over them as needed.

func squareMany(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

squareMany(numbers: 1, 2, 3, 4, 5, 6, 7)


// Writing throwing functions
// (error handling)
// Swift lets us throw errors from functions by marking them as throws __before)) their return type, then using the throw keyword when something goes wrong.

// First we need to define an enum that describes the errors we can throw. These must always be based on Swift’s existing Error type.
enum PasswordError : Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

// running throwing functions
// Swift doesn’t like errors to happen when your program runs, which means it won’t let you run an error-throwing function by accident.
// Instead, you need to call these functions using three new keywords
// do:
// try:
// catch

do {
    try checkPassword("password")
    print("Good password")
} catch {
    print("password not allowed")
}

// inout parameters
// you can pass in one or more parameters as `inout`, which means they can be changed inside your function, and those changes reflect in the original value outside the function.
// side effect!
func doubleInPlace(number: inout Int) {
    number *= 2
}
// To use this, you need to make a variable integer
// and use `&` (pointer?)
var myNum = 8
doubleInPlace(number: &myNum)
print(myNum)
