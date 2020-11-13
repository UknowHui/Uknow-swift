//
//  ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/4.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var basicBtn: UIButton!
    @IBOutlet weak var reverseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.reverseBtn.addTarget(self, action: #selector(reverseBtnClicked), for: .touchUpInside)
        
        let todoVCBtn = UIButton()
        
        todoVCBtn.backgroundColor = .cyan
        todoVCBtn.setTitle("3.app", for: .normal)
        todoVCBtn.setTitleColor(.white, for: .normal)
        todoVCBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(todoVCBtn)
        todoVCBtn.addTarget(self, action: #selector(todoVCBtnClicked), for: .touchUpInside)
        todoVCBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.top.equalTo(self.reverseBtn.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        let coreAnimationBtn = UIButton()
        coreAnimationBtn.backgroundColor = .blue
        coreAnimationBtn.setTitle("4.coreAnimation", for: .normal)
        coreAnimationBtn.setTitleColor(.white, for: .normal)
        coreAnimationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(coreAnimationBtn)
        coreAnimationBtn.addTarget(self, action: #selector(coreAnimationBtnClick), for: .touchUpInside)
        coreAnimationBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.top.equalTo(todoVCBtn.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        let leetcodeBtn = UIButton()
        leetcodeBtn.backgroundColor = .magenta
        leetcodeBtn.setTitle("5.leetcodeBtn", for: .normal)
        leetcodeBtn.setTitleColor(.white, for: .normal)
        leetcodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(leetcodeBtn)
        leetcodeBtn.addTarget(self, action: #selector(leetcodeBtnClick(_:)), for: .touchUpInside)
        leetcodeBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.top.equalTo(coreAnimationBtn.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        
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

