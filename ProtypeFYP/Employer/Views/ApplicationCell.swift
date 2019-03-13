//
//  ApplicationCell.swift
//  RecruitorInterface
//
//  Created by haider ali on 22/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class ApplicationCell: UICollectionViewCell {
    
    @IBOutlet weak var cvProfile: UIImageView!
    
    @IBOutlet weak var cvTitle: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cvImageView: UIImageView!
    

    override init(frame: CGRect) {
         super.init(frame: frame)
        print("son if a bitch")
        
        cvProfile.layer.masksToBounds = false
        cvProfile.layer.borderColor = UIColor.white.cgColor
        cvProfile.layer.cornerRadius = 40
        cvProfile.clipsToBounds = true
        
        saveButton.layer.cornerRadius = 22
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     //   fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    @IBAction func saveBtnCV(_ sender: UIButton) {
    }
}
