//
//  HHCoreAnimationViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/8/31.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCoreAnimationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        if #available(iOS 14.0, *) {
//            let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
//            let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//            self.collectionView.setCollectionViewLayout(layout, animated: true)
        } else {
            // Fallback on earlier versions

        }
        self.collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        if #available(iOS 14.0, *) {
//            var contentConfiguration = UIListContentConfiguration.cell()
//            contentConfiguration.image = UIImage(systemName: "hammer")
//            contentConfiguration.text = "Core Animation \(indexPath.row + 1)";
//            cell.contentConfiguration = contentConfiguration
//        } else {
            // Fallback on earlier versions
            cell.collectionImage?.image = UIImage(systemName: "hammer")
            cell.collectionLabel?.text = "Core Animation \(indexPath.row + 1)";
//        }
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let caStoryboard = UIStoryboard.init(name: "HHCoreAnimation", bundle: nil)
        
        switch indexPath.row + 1 {
        case 1:
            self.navigationController?.pushViewController(HHCAViewController(), animated: true)
            break
        case 5:
            let ca5VC = caStoryboard.instantiateViewController(identifier: "HHCA5ViewController")
            self.navigationController?.pushViewController(ca5VC, animated: true)
            break
        case 6:
            self.navigationController?.pushViewController(HHCA6ViewController(), animated: true)
            break
        case 7:
            self.navigationController?.pushViewController(HHCA7ViewController(), animated: true)
            break
        case 8:
            let ca8VC = caStoryboard.instantiateViewController(identifier: "HHCA8ViewController")
            self.navigationController?.pushViewController(ca8VC, animated: true)
            break
        case 9:
            self.navigationController?.pushViewController(HHCA9ViewController(), animated: true)
            break
        case 10:
            self.navigationController?.pushViewController(HHCA10ViewController(), animated: true)
            break
        case 11:
            self.navigationController?.pushViewController(HHCA11ViewController(), animated: true)
            break
        case 12:
            break
        case 13:
            self.navigationController?.pushViewController(HHCA13ViewController(), animated: true)
            break
        case 14:
            self.navigationController?.pushViewController(HHCA14ViewController(), animated: true)
            break
        default:
            break
            
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

