//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Leopold on 14/9/21.
//
// The very first "Technique Project"

import SwiftUI

// Day 23 - 1. Why use Struct?
// An important takeaway: data -> state -> view
// In UIKit: we operate it, hence all classes needed
// In SwiftUI: SwiftUI operates on our state (we describe it)
//      that's why there's no methods involved here
//      what we are doing is just declare data (using struct), and how it should look like


// 2. What's behind the main SwiftUI view?
//      e.g., the Text here
// Answer: for SwiftUI developers, there is nothing behind our view!!!
// what you see is all we have
// (unless you dig deeper, which will break the code)


// 3. Why modifier order matters?
// Whenever we apply a modifier to a SwiftUI view, we actually create a new view with that change applied – we don’t just modify the existing view in place.
// If you think about it, this behavior makes sense – our views only hold the exact properties we give them, so if we set the background color or font size there is no place to store that data.
//
// e.g.,
// Button("Hello World") {
//  // do nothing
// }
// .background(Color.red)
// .frame(width: 200, height: 200)
// is different to the reverse ordered modifiers
//
//     print(type(of: self.body))
// => ModifiedContent<ModifiedContent<Button<Text>, _BackgroundModifier<Color>>, _FrameLayout>
//
// My thought: eager evaluation???


// 4. Why does SwiftUI use “some View” for its view type?
// “opaque return types”
// “one specific type that conforms to the View protocol, but we don’t want to say what.”


// 5. Conditional modifiers
// It’s common to want modifiers that apply only when a certain condition is met, and in SwiftUI the easiest way to do that is with the ternary operator.
// Regular if isn't always allowed. The reason for it is: some View is not dynamic, it's just implicit.


// 6. Environment modifiers
// Many modifiers can be applied to containers, which allows us to apply the same modifier to many views at the same time.
// This is called an environment modifier, and is different from a regular modifier that is applied to a view.
// From a coding perspective these modifiers are used exactly the same way as regular modifiers. However, they behave subtly differently because if any of those child views override the same modifier, the child’s version takes priority.
// Eg .font() is a environment modifier
// That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
// To the best of my knowledge there is no way of knowing ahead of time which modifiers are environment modifiers and which are regular modifiers – you just need to experiment. Still, I’d rather have them than not: being able to apply one modifier everywhere is much better than copying and pasting the same thing into multiple places.



// 7. Views as properties
//  create a view as a property of your own view, then use that property inside your layouts.
// Swift doesn’t let us create one stored property that refers to other stored properties, because it would cause problems when the object is created. However, you can created computed properties.


// 8. View composition

// 9. Custom modifiers
// What is a modifier in swift?
// a function of View Struct
// extension View {... func here}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}

// 10. Custom containers
//


struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .prominentTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
