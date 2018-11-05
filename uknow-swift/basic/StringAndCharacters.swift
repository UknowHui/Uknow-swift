//
//  StringAndCharacters.swift
//  uknow-swift
//
//  Created by uknow on 2018/10/11.
//  Copyright © 2018 uknow. All rights reserved.
//

import UIKit

class StringAndCharacters: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let greeting = "Guten tag!"
        
        print(greeting[greeting.index(after: greeting.startIndex)])
        print(greeting[greeting.index(greeting.startIndex, offsetBy: 6)])
        
        var welcome = "hello"
        welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex))
        print(welcome)
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print(welcome)
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        print(welcome)
        
        let hello = "Hello, world!"
        let index = hello.firstIndex(of: ",") ?? hello.endIndex
        let beginning = hello[..<index]
        print(beginning)
        
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
        let combinedEAcuteQestion = "Voulez-vous un caf\u{65}\u{301}?"
        if eAcuteQuestion == combinedEAcuteQestion {
            print("\(eAcuteQuestion), \(combinedEAcuteQestion)")
        }
        
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1") {
                act1SceneCount += 1
            }
        }
        print(act1SceneCount)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
