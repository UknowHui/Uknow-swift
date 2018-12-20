//
//  NSError+Description.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/13.
//  Copyright © 2018年 uknow. All rights reserved.
//
import Foundation

//import SwiftyJSON

extension NSError {
    
    override open var description: String {
        
        var desc = String()
        if let errorData = self.userInfo["com.alamofire.serialization.response.error.data"] {
//            let json = JSON.init(errorData)
//            for (key, subJson) in json {
//                desc = desc + "👉 \(key) = \(subJson),\n"
//            }
        }

        return desc
        
        
    }
}
