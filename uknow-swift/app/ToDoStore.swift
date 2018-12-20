//
//  ToDoStore.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/13.
//  Copyright © 2018年 uknow. All rights reserved.
//

import Foundation

let dummy = ["Buy the milk",
             "Take my dog",
             "Rent a car"]
struct ToDoStore {
    static let shared = ToDoStore()
    func getToDoItems(completionHandle:(([String]) -> Void)?) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandle?(dummy)
        }
    }
}

