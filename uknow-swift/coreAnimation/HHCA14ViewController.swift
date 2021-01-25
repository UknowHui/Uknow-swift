//
//  HHCA14ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/12/10.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA14ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imagePaths = [Any]()
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        imagePaths = Bundle.main.paths(forResourcesOfType: "png", inDirectory: "Vacation Photos")
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 10
        collectionViewLayout.minimumInteritemSpacing = 10
        collectionViewLayout.itemSize = CGSize(width: 200, height: 200)
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height), collectionViewLayout: collectionViewLayout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView!)

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagePaths.count
    }
    func loadImageAtIndex(_ index: Int) -> UIImage? {
        let cache = NSCache<CustomKey, AnyObject>()
        let image = cache.object(forKey: CustomKey(int: index, string: String(index)))
        if image != nil {
            if image!.isKind(of: NSNull.self) {
                return nil
            }else{
                return image as? UIImage
            }
        }
        
        cache.setObject(NSNull.self, forKey: CustomKey(int: index, string: String(index)))
        
        DispatchQueue.global().async {
            let imagePath = self.imagePaths[index]
            
            var image = UIImage(contentsOfFile: imagePath as! String)
            
            UIGraphicsBeginImageContextWithOptions(image?.size ?? CGSize.zero, true, 0)
            image?.draw(at: CGPoint.zero)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            DispatchQueue.main.async {
                cache.setObject(image ?? NSNull.self, forKey: CustomKey(int: index, string: String(index)))
                let indexPath = NSIndexPath.init(item: index, section: 0)
                let cell = self.collectionView?.cellForItem(at: indexPath as IndexPath)
                let imageView = cell?.contentView.subviews.last as? UIImageView
                imageView?.image = image
                
            }
        }
        return nil
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
//        var imageView = cell.viewWithTag(99) as? UIImageView
//        if imageView == nil {
//            imageView = UIImageView(frame: cell.contentView.bounds)
//            imageView!.tag = 99
//            cell.contentView.addSubview(imageView!)
//        }
//        let imagePath = imagePaths[indexPath.row]
//        imageView!.image = UIImage.init(named: imagePath as! String)
        
//        cell.tag = indexPath.row
//        let globalQueue = DispatchQueue.global(qos: .unspecified)
//        globalQueue.async {
//            let imagePath = self.imagePaths[indexPath.row]
//            let image = UIImage.init(contentsOfFile: imagePath as! String)
//            DispatchQueue.main.async {
//                if indexPath.row == cell.tag {
//                    imageView?.image = image
//                }
//            }
//        }
        
        var imageView = cell.contentView.subviews.last as? UIImageView
        if imageView != nil {
            imageView = UIImageView.init(frame: cell.contentView.bounds)
            imageView?.contentMode = .scaleAspectFit
            cell.contentView.addSubview(imageView!)
        }
        
        imageView?.image = self.loadImageAtIndex(indexPath.item)
        if indexPath.item < self.imagePaths.count - 1 {
            self.loadImageAtIndex(indexPath.item + 1)
        }
        if indexPath.item > 0 {
            self.loadImageAtIndex(indexPath.item - 1)
        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    final class CustomKey : NSObject {
        let int: Int
        let string: String
        
        init(int: Int, string: String) {
            self.int = int
            self.string = string
        }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let other = object as? CustomKey else {
                return false
            }
            return int == other.int && string == other.string
        }
        
        override var hash: Int {
            return int.hashValue ^ string.hashValue
        }
    }
}
