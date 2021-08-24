import SwiftUI

// # Variable
// Dynamic and Weak
var greeting = "Hello, playground"
greeting = "Goodbye!"

// multi-line String
var str1 = """
    this
    goes
    this
"""

//If you only want multi-line strings to format your code neatly, and you don’t want those line breaks to actually be in your string, end each line with a **`\`**, like this:

    var str2 = """
    This goes \
    over multiple \
    lines
    """


// double and boolean
var pi = 3.141 // this is a double type
var choice = true

// String interpolation
var score = 85
var str = "Your score was \(score)"
var results = "The test results are here: \(str)"

// Constants
let neverChanged = "Swift"
// always use let unless you do want to change something

// Type annotations
// Previously we use type inference based on how we created it
// Now static
let str3: String = "Reputation"
let year: Int = 2021
let isYear: Bool = false

