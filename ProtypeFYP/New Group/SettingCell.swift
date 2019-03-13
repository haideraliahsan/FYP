//
//  SettingCell.swift
//  DemoYoutube
//
//  Created by haider ali on 28/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.darkGray
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var settings: Settings? {
        didSet{
            nameLabel.text = settings?.name
            if let imageName = settings?.imageName {
                imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = UIColor.darkGray
            }
        }
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        return label
    }()
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "iconfinder_icon-search_2867938.png.png")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(imageView)
        
        
        addConstrintWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: imageView, nameLabel)
        addConstrintWithFormat(format: "V:|[v0]|", views: nameLabel)
        
        addConstrintWithFormat(format: "H:[v0(30)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
        
        
        
        
    }
    
    
}
