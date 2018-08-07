//
//  ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/4.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var reverseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.reverseBtn.addTarget(self, action: #selector(reverseBtnClicked), for: .touchUpInside)
        
        let dic = Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +)
        print(dic)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController {
    
    @objc private func reverseBtnClicked(_ send: UIButton) {

        
        self.navigationController?.pushViewController(reverse(), animated: true)
    }
}

