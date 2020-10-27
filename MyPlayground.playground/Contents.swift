//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World! 你好"
        label.textColor = .black

        view.addSubview(label)
        self.view = view
//
//
//        let httpError = (504, "Server")
//        let (code, _) = httpError
//        let codeByIndex = httpError.0
//        print(codeByIndex, code)
//
//        var catchphrase: String?
//        catchphrase = "hey"
//        let count1: Int = catchphrase!.count
//        print(count1)
//        if let count = catchphrase?.count {
//            print(count)
//        }
//        let count2: Int = catchphrase?.count ?? 0
//        print(count2)
//        let count3: Int? = catchphrase?.count
//        print(count3)
//
//        let forcedCatchphrase: String! = "hey, what's up"
//        let implicitCatchphrase = forcedCatchphrase
//        print(implicitCatchphrase)
//
//        let immutableArray: [String] = ["alice", "bob"]
//        let name = immutableArray[0]
//        print(name)
//
//        var mutableArray = ["eve", "frank"]
//        mutableArray[1] = "bart"
//        print(mutableArray)
//
//        var mutableDict = ["name":"picard", "rank":"captain"]
//        let rankWasRemoved = mutableDict.removeValue(forKey: "rank1")
//        print(rankWasRemoved)
//
//        var x = 0
//        repeat {
//            x -= 1
//            print(x)
//        }while(x > -3)
//
//        for n in 1...30 {
//            guard n == 3 else {
//                continue
//            }
//            print("\(n) is even")
//        }
        sayHello(name: "nihao")
        add(x: 1, y: 2)
    }
    func sayHello(name:String) {
        print("hello \(name)")
    }
    func add(x:Int, y:Int) -> Int {
        return x + y
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
