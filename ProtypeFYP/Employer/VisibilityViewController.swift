//
//  VisibilityViewController.swift
//  RecruitorInterface
//
//  Created by haider ali on 22/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class VisibilityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let titl: [String] = ["Mark David From UK","Keily lyn From USA","Briana From Asutrailia","Malik Abdullah From Pakistan"]
    let skills: [String] = ["Web Designing, PHP developer", "Web Engineering, ASP.NET", "IOS Developer, Swift", "Android Developer", "Python Developer", ""]
    
    let array: [String] = ["devtoolspromo", "wall1", "thumb", "thumbNail"]
    let profileImages: [String] = ["profileImage","profileImage","profileImage","profileImage"]
    
    @IBOutlet weak var visibilityCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedCell", for: indexPath) as! VisibilityCell
        cell.profileImageView.image = UIImage(named: array[indexPath.row])
        cell.title.text = titl[indexPath.row]
        cell.cvDescription.text = skills[indexPath.row] + ", " + skills[4 - indexPath.row] + " " + skills[indexPath.row]
        
        cell.backgroundColor = UIColor.darkGray
        cell.profileImageView.layer.masksToBounds = false
        cell.profileImageView.layer.borderColor = UIColor.white.cgColor
        cell.profileImageView.layer.cornerRadius = 40
        cell.profileImageView.clipsToBounds = true
        
        cell.backgroundColor = UIColor.white
        return cell
    }
    

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
        visibilityCollectionView.backgroundColor = UIColor.darkGray
        visibilityCollectionView.collectionViewLayout = layout
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
