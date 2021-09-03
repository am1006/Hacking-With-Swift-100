import SwiftUI

/**
 # Day 12 - Optionals
 
 Swift's solution to NULL references
 
 In essence, an optional is trying to answer the question “what if our variable doesn’t have a value?”
 */

/**
 ## Handling missing data
 
 Swift’s solution is called optionals, and you can make optionals out of any type.
 
 It might have no value at all – it might literally be missing, which is `nil` in Swift.
 */

var age: Int? = nil

/// That doesn’t hold any number – it holds __nothing__. But if we later learn that age, we can use it:

age = 38

/**
 ## Unwrapping optionals

 Optional strings might contain a string like “Hello” or they might be nil – nothing at all.
 */

/// Consider this optional string:

var name: String? = nil

/// What happens if we use `name.count`? A real string has a `count` property that stores how many letters it has, but this is `nil` – it’s empty memory, not a string, so it doesn’t have a `count`
/// Because of this, trying to read name.count is unsafe and Swift won’t allow it.
/// Instead, we must look inside the optional and see what’s there – a process known as _unwrapping_.
/// A common way of unwrapping optionals is with if let syntax, which unwraps with a condition.
/// If there was a value inside the optional then you can use it, but if there wasn’t the condition fails.

if let unwrapped = name {
    print("\(unwrapped.count) letters.")
} else {
    print("Missing name.")
}

/// Explanation: If `name` holds a string, it will be put inside `unwrapped` as a regular `String` and we can read its `count` property inside the condition. Alternatively, if `name` is empty, the `else` code will be run.

/**
 ## Unwrapping with guard
 
 An alternative is `guard let`
 
 `guard let` will unwrap an optional for you, but if it finds `nil` inside it expects you to **exit the function, loop, or condition** you used it in.
 
 Using `guard let` lets you deal with problems at the start of your functions, then exit immediately. This means the rest of your function is the happy path.
 */

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}

greet(nil)

/**
 ## Force Unwrapping
 
 Optionals represent data that may or may not be there, but sometimes you know for sure that a value isn’t nil.
 
 In these cases, Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type.
*/

let str = "5"

/// That makes `num` an optional `Int` because you might have tried to convert a string like “Fish” rather than “5”.
/// ```
/// let num = Int(str)
/// ```

/// Even though Swift isn’t sure the conversion will work, you can see the code is safe so you can force unwrap the result by writing `!` after `Int(str)`, like this:
let num = Int(str)!

/// Swift will immediately unwrap the optional and make `num` a regular `Int` rather than an `Int?`
/// But if you’re wrong – if `str` was something that couldn’t be converted to an integer – your code will crash.
/// As a result, you should force unwrap only when you’re sure it’s safe – there’s a reason `!` is often called the crash operator.

/**
 ## Implicitly unwrapped optionals

 Like regular optionals, implicitly unwrapped optionals might contain a value or they might be nil. However, unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional at all (i.e., regular values).

 Implicitly unwrapped optionals are created by adding an exclamation mark after your type name, like this:
*/

let secondAge: Int! = nil

/**
 Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals. However, if you try to use them and they have no value – if they are nil – your code crashes.

 Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it. Because you know they will have a value by the time you need them, it’s helpful not having to write if let all the time.

 That being said, if you’re able to use regular optionals instead, it’s generally a good idea.
 */

/**
 ## Nil coalescing `??`

 The nil coalescing operator unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was `nil` – then a default value is used instead. Either way, the result won’t be optional: it will either by the value from inside the optional or the default value used as a back up.

 Here’s a function that accepts an integer as its only parameter and returns an optional string:
*/

 func username(for id: Int) -> String? {
     if id == 1 {
         return "Taylor Swift"
     } else {
         return nil
     }
 }

/**
 If we call that with ID 15 we’ll get back `nil` because the user isn’t recognized, but with nil coalescing we can provide a default value of “Anonymous” like this:
*/

 let user = username(for: 15) ?? "Anonymous"

/**
 That will check the result that comes back from the `username()` function: if it’s a string then it will be unwrapped and placed into `user`, but if it has `nil` inside then “Anonymous” will be used instead.
 */

/**
 ## Optional chaining
 
 Swift provides us with a shortcut when using optionals: if you want to access something like `a.b.c` and `b` is optional, you can write a question mark after it to enable optional chaining: `a.b?.c`.
 */
