//
//  ApplicationViewController.swift
//  RecruitorInterface
//
//  Created by haider ali on 22/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let array: [String] = ["wall1", "shutterstock_374227048", "thumb", "thumbNail"]
    let titl: [String] = ["Malik Abdullah From Pakistan","Mark David From UK","Keily lyn From USA","Briana From Asutrailia"]
    let profile: [String] = ["shutterstock_374227048", "thumb", "profile", "profileImage"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppCell", for: indexPath) as! ApplicationCell
        cell.cvImageView.image = UIImage(named: array[indexPath.row])
        cell.cvTitle.text = titl[indexPath.row]
        cell.cvProfile.image = UIImage(named: profile[indexPath.row])
        
        
        return cell
    }
    
    
    @IBOutlet weak var SecondCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        print(topBarHeight)
        
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = cellWidth
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        
        SecondCollectionView.collectionViewLayout = layout
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

