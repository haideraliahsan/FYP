//
//  HomeCell.swift
//  RecruitorInterface
//
//  Created by haider ali on 22/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var title: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        // Initialization code
    }
    
    func setupViews () {
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width - 16
        print("asdfasdfsdfadsf")
        let height = width * 9 / 16
        thumbNailImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
   
  
    
}
