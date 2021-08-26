import SwiftUI

// Arithmetic operator

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

// Operator overloading
// what an operator does depends on the values you use it with
// e.g. + sums integers, joins strings, and join arrays.
// Still type safe though


// Compound assignment operators
var score = 95
score -= 5

var quote = "Hello, "
quote += "World!"

// Comparision operators
firstScore == secondScore
firstScore != secondScore
firstScore < secondScore
firstScore >= secondScore

// We can compare strings' alphabetical order
"Taylor" <= "Swift"

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 1 {
    print("BlackJack!")
}
else if firstCard == 11 {
    print("Lucky")
}
else {
    print("nothing")
}

// Combining conditions
// && and
// || or

// The ternary operator
print(firstCard == secondCard ? "Cards are the same" : " Cares are different")


// Switch statement
// Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword like this:

let weather = "rain"
switch weather {
case "rain":
    print("Bring an umbrella")
    fallthrough
default:
    print("Enjoy the day")
}

// Range operators
// Swift gives us two ways of making ranges:
// ..< (up to but exclude the final value)
// ... (up to and include the final value)
//
let score1 = 84

switch score1 {
case 0..<50:
    print("Failed.")
case 50..<85:
    print("Pass...HD.")
default:
    print("You did great!")
}


