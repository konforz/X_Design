import UIKit

//SWIFT CLASS 1

class Coolclass {
    var name: String
    var age: Int
    
    init(_ name: String, age:Int) {
        self.name = name
        self.age = age
    }
    func sayHello() {
        print("hello! My name is \(name) and i am \(age) years old.")
    }
    
}

class TheOtherclass: Coolclass{
    
}
let coolio = Coolclass( "coolio" , age: 100)
coolio.sayHello()


struct MyStruct {
    var name: String
    var age: Int
}

var myStruct = MyStruct(name: "stuff", age: .max)
let MyOtherStruct = myStruct



enum TheEnum {
case first
case second
}

let theEnum = TheEnum.first

switch theEnum {
case.first:
    print("this is first case")
case.second:
    print("this is second case")
}

let thestring = ""
switch thestring {
    
case "":
    print("empty case")
case "hello":
    print("hello case")
case "hi":
    print("hi case")
case "goodbye":
    print("goodbye case")
default:
    print("no idea what you are talking about")
}


//Optionals: Optionals are values that could be nil, or have no value
//Optionals are defined by a question mark after the type
var optionalString: String? = "hello"
print(optionalString)


func print(thesrting: String) {
    print(thestring)
}
//ways to handle optionals

//1. Force unwrap
//crashed the app if it is nil.
//DON'T USE THIS. EVER
print(thesrting: optionalString!)

//2. Nil Coalescing
//Give it a default value if it is nil
print(thesrting: optionalString ?? "no value")

//3. conditional binding
if let unwrappedString = optionalString {
    print(thesrting: unwrappedString)
}

//Other variation is called guard let
func print(optionalString: String?) {
    guard let unwrappedString = optionalString else {
        print("it has no value!")
        return
    }
    print(thesrting: unwrappedString)
}
//4. Optional Chaining
print(optionalString?.first?.asciiValue?.byteSwapped)

//5. Implicitly unrwapped optionals
var someString: String!

//SWIFT PROTOCALS
protocol catalyst {
    func Action ()
    
}

class spark {
    var name: String
    var age: Int
    
    init(name: String) {
        age = 0
        self.name = name
    }
}
class Actionspark: spark {}
extension Actionspark: catalyst {
    func Action() {
    print("i can create sparks")
    }
}
    func Action() {
        print("I am good at catalytic reactions")
}

//closures: Block of code that can be passed around like a variable
let myClosure: (Int, Int)-> Bool = {firstInput, secondInput in
    return firstInput > secondInput
}
let theClosure: (Int, Int)-> Bool = { return $0 < $1}
let myArray = [1, 2, 3]
print(myArray.filter({ $0 % 2 == 0 }))
print(myArray)
//END CLASS



