import UIKit

//var str = "Hello, playground"
//
//func add(_ x:Int, y:Int)->Int{
//    x+y
//}
//
//print(add(123, y: 2))
//
//func add1(_ x: Int, y yVal:Int) -> Int {
//    return x + yVal;
//}
//
//print(add1(2, y: 3))
//
//func doMath(openration: (Int, Int) -> Int, a: Int, b: Int) -> Int {
//    return openration(a, b)
//}
//let adder: (Int, Int) -> Int = { (x, y) in x + y }
//
//let square: (Int) -> Int = { $0 * $0 }
//
//print(doMath(openration: adder, a: 2, b: 3))
//
//enum Food: CaseIterable {
//    case pasta, pizza, hamburger
//}
//for food in Food.allCases {
//    print(food)
//}
//enum Currency: String {
//    case euro = "EUR"
//}
//print(Currency.euro.rawValue)
//
//enum Content {
//    case empty
//    case text(String)
//    case number(Int)
//}
//
//let content = Content.number(23)
//
//switch content {
//case .empty:
//    print("value is empty")
//case .text(let val):
//    print(val)
//case .number(let value):
//    print(value)
//}
//
//struct User {
//    var name: String
//    var age: Int = 40
//}
//
//let john = User(name: "John")
//print(john.age)


class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("perform the deinitialization")
    }
    
    var numberOfLaughs: Int = 0
    func laugh() {
        numberOfLaughs += 1
    }
    
    var isHappy: Bool {
        return numberOfLaughs > 0
    }
}

let david = Person(name: "David")
//david.laugh()
//let happy = david.isHappy
//print(happy)

class Student: Person {
    var numberOfExams: Int = 0
    
    override var isHappy: Bool {
        numberOfLaughs > 0 && numberOfExams > 2
    }
}
let ray = Student(name: "Ray")
//ray.numberOfExams = 4
ray.laugh()
let happy = ray.isHappy
print(happy)

enum  BeverageMachineError: Error {
    case invalidSelection
    case insufficientFunds
    case outOfStock
}
func selectBeverage(_ selection: Int) throws -> String {
    return "waiting for beverage"
}
let message: String
do {
    message = try selectBeverage(20)
} catch BeverageMachineError.invalidSelection {
    print("invalid")
}catch BeverageMachineError.insufficientFunds {
    print("insufficient")
}catch BeverageMachineError.outOfStock {
    print("outofstock")
}catch {
    print("generic error")
}
let nillableMessage = try! selectBeverage(10)
print(nillableMessage)


let di = DispatchQueue(label: <#T##String#>, qos: <#T##DispatchQoS#>, attributes: <#T##DispatchQueue.Attributes#>, autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>, target: <#T##DispatchQueue?#>)
