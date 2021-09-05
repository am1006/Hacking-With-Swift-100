import SwiftUI

/**
 # Swift review, day two
 */

/**
 ## Functions
 
 Notice a few things:
 
 1. External and internal parameter names
 2. the “Swifty” way of writing this function is like so: `func countLetters(in string: String)`: reads like natural English, but the code is also clear and concise.

 */

/**
 ## Optionals
 */

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status: String?
status = getHaterStatus(weather: "rainy")

/// Or using type inferrence:

var status2 = getHaterStatus(weather: "rainy")

/**
 ## Optional chaining
 */


/**
 ## Enumerations
 */

/**
 ## Structs
 */

/**
 ## Classes
 
 
 Working with Objective-C code
 If you want to have some part of Apple’s operating system call your Swift class’s method, you need to mark it with a special attribute: @objc. This is short for “Objective-C”, and the attribute effectively marks the method as being available for older Objective-C code to run – which is almost all of iOS, macOS, watchOS, and tvOS. For example, if you ask the system to call your method after one second has passed, you’ll need to mark it with @objc.

 Don’t worry too much about @objc for now – not only will I be explaining it in context later on, but Xcode will always tell you when it’s needed. Alternatively, if you don’t want to use @objc for individual methods you can put @objcMembers before your class to automatically make all its methods available to Objective-C.


 */
