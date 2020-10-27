//
//  GroupViewController.swift
//  Demo
//
//  Created by Paolo Cuscela on 31/10/17.
//  Copyright © 2017 Paolo Cuscela. All rights reserved.
//

import UIKit
import Cards

class GroupViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let icons: [UIImage] = [
            
            UIImage(named: "grBackground")!,
            UIImage(named: "background")!,
            UIImage(named: "flappy")!,
            UIImage(named: "flBackground")!,
            UIImage(named: "Icon")!,
            UIImage(named: "mvBackground")!
            
        ]
        let sliding = CardGroupSliding()
        sliding.frame = CGRect(x: 20, y: 100, width: 200, height: 200)
        sliding.icons = icons
        self.view.addSubview(sliding)
        
        
        
        let slidingCardContent = CardContentViewController()
        sliding.shouldPresent(slidingCardContent, from: self, fullscreen: true)
        
        
    }

}
