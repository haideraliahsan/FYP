//
//  HomeViewController.swift
//  RecruitorInterface
//
//  Created by haider ali on 22/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let titl: [String] = ["Mark David From UK","Keily lyn From USA","Briana From Asutrailia","Malik Abdullah From Pakistan"]
    
    
    let array: [String] = ["devtoolspromo", "wall1", "thumb", "thumbNail"]
    let profileImages: [String] = ["profileImage","profileImage","profileImage","profileImage"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home", for: indexPath) as! HomeCell
        cell.thumbNailImageView.image = UIImage(named: array[indexPath.row])
        cell.profilePhoto.image = UIImage(named: profileImages[indexPath.row])
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width - 16
        print("asdfasdfsdfadsf")
        let height = width * 9 / 16
        cell.thumbNailImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        cell.title.text = titl[indexPath.row]
        
        
        cell.profilePhoto.layer.masksToBounds = false
        cell.profilePhoto.layer.borderColor = UIColor.white.cgColor
        cell.profilePhoto.layer.cornerRadius = 40
        cell.profilePhoto.clipsToBounds = true
        
        
        return cell
    }
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        print(topBarHeight)
        
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = (cellWidth * 9 / 16) + 100
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        mainCollectionView.collectionViewLayout = layout
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


