import UIKit

func filterEvens(array: [Int], filterClosure: (Int) -> Bool) -> [Int]{
    var arrayTest: [Int] = []
    for element in array {
        if filterClosure(element) {
            arrayTest.append(<#T##newElement: Int##Int#>)
        print(element)
            print(arrayTest)
        
}
return arrayTest
    }
    let closure: (Int) -> Bool = {$0 % 2 == 0}
    print(filterEvens(array: [1,2,5,10,20,33,67,90,101], filterClosure: closure))

    return []
}

func printElements(array: [Int], doClosure: (Int) -> Void) {
    for element in array {
        doClosure (element)
    }
}
let printClosure: (Int) -> Void = {print($0 / 2)}
printElements(array: [5, 10, 15, 20, 25, 30], doClosure: printClosure)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func intToDouble(array: [Int]) -> [Double] {
    var anotherArray: [Double] = []
    for element in array {
        anotherArray.append(Double(element))
    }
    return anotherArray
}

print(intToDouble(array:[1,2,3]))
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func intToDouble<T>(array: [Int], mapClosure: (Int)-> T) -> [T] {
    var anotherArray: [T] = []
    for element in array {
        anotherArray.append(mapClosure(element))//append puts Int into the next empty spot in array
        //for(index, element) in array.enumerated(){
    }
    return anotherArray
}

print(intToDouble(array:[1,2,3], mapClosure: {String($0)}))

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









