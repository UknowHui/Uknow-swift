//
//  HHCA13ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/12/7.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA13ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let drawingView : UIView = Bundle.main.loadNibNamed("DrawingView", owner: nil, options: nil)?.first as! UIView
        drawingView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height)
        self.view.addSubview(drawingView)
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
