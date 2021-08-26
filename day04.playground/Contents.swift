import SwiftUI

// Today, everything is about loops

// For loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

// use an underscore instead so that Swift doesn’t create needless values
for _ in 1...5 {
    print("Let's go")
}

// while loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come...")

// Repeat loops (do while)
repeat {
    print(number)
    number += 1
} while number <= 25

// compare these two:
repeat {
    print("This is false")
} while false

// and
// this: (you will get a warning)

//while false {
//    print("This is false")
//}

// Existing loops
// using the "break" keyword

var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if (countDown == 4) {
        print("I'm bored. Let's go now")
        break
    }
    countDown -= 1
}

// Existing multiple loops
// A nested loop case:

outerloop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerloop
            // if it's just a normal break, it will only break out of the inner loop.
        }
    }
}

// skipping items
// using the "continue" keyword

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print("Even number: \(i)")
}

// infinite loops
// using while loop to make infinite loops
// It’s common to use while loops to make infinite loops: loops that either have no end or only end when you’re ready.
// All apps on your iPhone use infinite loops, because they start running, then continually watch for events until you choose to quit them.

// To make an infinite loop, just use true as your condition. true is always true, so the loop will repeat forever. Warning: Please make sure you have a check that exits your loop, otherwise it will never end.

var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 20 {
        break
    }
}
