//
//  ControlFlow.swift
//  uknow-swift
//
//  Created by uknow on 2018/10/26.
//  Copyright © 2018 uknow. All rights reserved.
//

import UIKit

class ControlFlow: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
//        let base = 3
//        let power = 10
//        var answer = 1
//        for _ in 1...power {
//            answer *= base
//        }
//        print("\(base) to the power of \(power) is \(answer)")
//
//
//        let minutes = 60
//        for tickMark in 0..<minutes {
//            print(tickMark)
//        }
//        // 每5分钟一个标记
//        let minuteInterval = 5
//        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
//            print(tickMark)
//        }
//        for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
//            print(tickMark)
//        }
        
        /**
         * 给出一个由数字组成的字符串和一个数，返回一个字符串中连续元素的和等于所给数的子字符串
         *
         * 若找不到符合要求的子字符串则返回nil
         * 若找到多于一个符合要求的子字符串则返回最靠前的一个
         *
         * 基本要求：可运行并返回正确结果，保证健壮性
         * 加分要求：时间复杂度为2n
         *
         * 举例：@"954891", 17 => @"548"
         */
        
//        let string = "95489135623"
//        let target = 17
//
//        var i = 0
//        var j = 0
//        while j < string.count {
//
//            var result = 0
//            var resultStr = ""
//            j += 1
//            for s in i..<string.count {
//                let str = string[string.index(string.startIndex, offsetBy: s)]
//                if result >= target {
//                    i += 1
//                    if result == target {
//                        print(result)
//                        print(resultStr)
//                    }
//                    result = 0
//                    resultStr = ""
//                    break
//                }
//                result += Int(String(str))!
//                resultStr += String(str)
//            }
//        }
        
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        
        board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2
        board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8
        
        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            diceRoll += 1
            if diceRoll == 7 {
                diceRoll = 1
            }
            square += diceRoll
            if square < board.count {
                square += board[square]
            }
        }
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
