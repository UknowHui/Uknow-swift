//
//  CollectionTypes.swift
//  uknow-swift
//
//  Created by uknow on 2018/10/12.
//  Copyright © 2018 uknow. All rights reserved.
//

import UIKit

class CollectionTypes: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let threeDoubles = Array(repeating: 0.0, count: 3)
        print(threeDoubles)
        
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        print(threeDoubles + anotherThreeDoubles)
        
        var shoppingList = ["Eggs", "Milk"]
        print(shoppingList.count)
        shoppingList.append("Flour")
        shoppingList += ["Baking Powder", "Cheese"]
        print(shoppingList)
        shoppingList[1] = "Six eggs"
        print(shoppingList)
        
        shoppingList.insert("Maple Syrup", at: 0)
        print(shoppingList)
        shoppingList.remove(at: 0)
        print(shoppingList)
        if shoppingList.contains("Flour") {
            print("I get up on the good foot")
        }
        
        for (index, value) in shoppingList.enumerated() {
            print("item \(index):\(value)")
        }
        
        // 合集 set
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        letters.insert("a")
        print(letters)
        letters = []
        print(letters)
        
        var favoriteGenre: Set = ["Rock", "Classical", "Hip hop"];
        print(favoriteGenre.count)
        if let removedGenre = favoriteGenre.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        }
        favoriteGenre.insert("Jazz")
        
        for genre in favoriteGenre {
            print("\(genre)")
        }
        for genre in favoriteGenre.sorted() {
            print("\(genre)")
        }
        
        // 合集操作
        var oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        
        print(oddDigits.intersection(evenDigits))
        print(oddDigits.symmetricDifference(singleDigitPrimeNumbers))
        print(oddDigits.union(evenDigits).sorted())
        print(oddDigits.subtract(evenDigits))
        
        let houseAnimals: Set = ["?", "?"]
        let farmAnimals: Set = ["?", "?", "?", "?", "?"]
        let cityAnimals: Set = ["?", "?"]
        
        print(houseAnimals.isSubset(of: farmAnimals))
        print(farmAnimals.isSuperset(of: houseAnimals))
        print(farmAnimals.isDisjoint(with: cityAnimals))
        
        // 字典
        var namesOfIntegers = [Int:String]()
        namesOfIntegers[16] = "sixteen"
//        namesOfIntegers = [:]
        print(namesOfIntegers)
        
        var airports = ["YYZ": "Toronto", "DUB": "Dublin"]
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        }
        airports["LHR"] = "London"
        print(airports)
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print(oldValue)
        }
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        let airportCodes = [String](airports.keys)
        print(airportCodes)
        let airportNames = [String](airports.values)
        print(airportNames)
        
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
