//
//  ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/4.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var basicBtn: UIButton!
    @IBOutlet weak var reverseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.reverseBtn.addTarget(self, action: #selector(reverseBtnClicked), for: .touchUpInside)
        
        let todoVCBtn = UIButton(frame: CGRect(x: 20, y: 220, width: UIScreen.main.bounds.size.width - 40, height: 40))
        
        todoVCBtn.backgroundColor = .cyan
        todoVCBtn.setTitle("3.app", for: .normal)
        todoVCBtn.setTitleColor(.white, for: .normal)
        todoVCBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(todoVCBtn)
        todoVCBtn.addTarget(self, action: #selector(todoVCBtnClicked), for: .touchUpInside)
        
        let coreAnimationBtn = UIButton(frame: CGRect(x: 20, y: 280, width: UIScreen.main.bounds.size.width - 40, height: 40))
        coreAnimationBtn.backgroundColor = .blue
        coreAnimationBtn.setTitle("4.coreAnimation", for: .normal)
        coreAnimationBtn.setTitleColor(.white, for: .normal)
        coreAnimationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(coreAnimationBtn)
        coreAnimationBtn.addTarget(self, action: #selector(coreAnimationBtnClick), for: .touchUpInside)
        
        let leetcodeBtn = UIButton(frame: CGRect(x: 20, y: 340, width: UIScreen.main.bounds.size.width - 40, height: 40))
        leetcodeBtn.backgroundColor = .magenta
        leetcodeBtn.setTitle("5.leetcodeBtn", for: .normal)
        leetcodeBtn.setTitleColor(.white, for: .normal)
        leetcodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(leetcodeBtn)
        leetcodeBtn.addTarget(self, action: #selector(leetcodeBtnClick(_:)), for: .touchUpInside)
        
        
//        let dic = Dictionary("hello".map { ($0, 1) }, uniquingKeysWith: +)
//        print(dic)
        
        
    }
    @IBAction func basicBtnClick(_ sender: Any) {
        
//        self.navigationController?.pushViewController(StringAndCharacters(), animated: true)
//        self.navigationController?.pushViewController(CollectionTypes(), animated: true)
        self.navigationController?.pushViewController(ControlFlow(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController {
    
    @objc private func reverseBtnClicked(_ send: UIButton) {

        
        self.navigationController?.pushViewController(ListTableViewController(), animated: true)
    }
    
    @objc private func todoVCBtnClicked(_ send: UIButton) {
        
        self.navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc private func coreAnimationBtnClick(_ send: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let caVC = mainStoryboard.instantiateViewController(identifier: "HHCoreAnimationViewController")
        self.navigationController?.pushViewController(caVC, animated: true)
    }
    
    @objc private func leetcodeBtnClick(_ send: UIButton) {
        
        self.navigationController?.pushViewController(HHLeetcodeViewController(), animated: true)
    }
}

