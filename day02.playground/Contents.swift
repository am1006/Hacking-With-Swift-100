import SwiftUI

// Arrays
let john = "Lennon"
let paul = "McCartney"
let george = "Harrison"
let ringo = "Starr"

let beatles: [String] = [john, paul, george, ringo]

beatles [1]
//beatles[10]

// Sets
// 1. Items aren’t stored in any order; they are stored in what is effectively a random order.
// 2. No item can appear twice in a set; all items must be unique.

let colors = Set(beatles)

// Tuples
// Also known as Struct Lite™ (but not really)
// 1. You can’t add or remove items from a tuple; they are fixed in size.
// 2. You can’t change the type of items in a tuple; they always have the same types they were created with.
// 3. You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.

var name = (first: "Taylor", last: "Swift")
name.0
name.1
name.first
name.last = "Swift UI"

name.self

// Arrays, sets, tuples
// distinct uses
// 1. If you need a specific, fixed collection of related values where each item has a __precise position or name__, you should use a tuple:

let address : (Double, String, String) = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")


// 2. If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:

let set : Set<String> = Set(["aardvark", "astronaut", "azalea"])

// 3. If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:

// let pythons = ["Eric", "Graham", "John", "Mich

// Dictionaries
// rather than storing things with an integer position you can access them using anything you want.

let heights : [String : Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

// Dictionary defaul values
// but we can give it a default value
heights["char"]
heights["Charlotte", default: 100]

// Creating empty collections
// Arrays, sets, and dictionaries are called collections, because they collect values together in one place.

// If you want to create an empty collection just write its type followed by opening and closing parentheses.

// For example, we can create an empty dictionary:
var teams = [String: String]()
teams["Paul"] = "Red"

// Create an array:
var results = [Int]()

// Sets are different:
var words = Set<String>()
var numbers = Set<Int>()

// This is because Swift has special syntax only for dictionaries and arrays;
// i.e., syntactic sugar
// other types must use angle bracket syntax like sets.
// but of course we can use normal ways for dictionary and array
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()

// Enumerations
enum Result {
    case success
    case failure
}

let result4 = Result.failure

// Enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")
let singing = Activity.singing(volume: 20)

// Enum raw values
// Sometimes you need to be able to assign values to enums so they have meaning. This lets you create them dynamically, and also use them in different ways.

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
// Swift will __automatically assign each of those a number starting from 0__,
//
//  and you can use that number to create an instance of the appropriate enum case. For example, earth will be given the number 2, so you can write this:
var earth = Planet(rawValue: 2)
// this equals to:
earth = Planet.earth

//  you want, you can assign one or more cases a specific value, and Swift will generate the rest. It’s not very natural for us to think of Earth as the second planet, so you could write this:

enum Planet2: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
// Now Swift will assign 1 to mercury and count upwards from there, meaning that earth is now the third planet:
Planet2(rawValue: 3)
