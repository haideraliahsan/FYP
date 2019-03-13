//
//  LauncherSettings.swift
//  DemoYoutube
//
//  Created by haider ali on 27/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class Settings: NSObject {
    let name: String
    let imageName: String
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class LauncherSettings: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    let blackView = UIView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    
    let settings: [Settings] = {
        return [Settings(name: "settings", imageName: "iconfinder_icon-search_2867938.png.png"), Settings(name: "Terms & Privacy", imageName: "iconfinder_icon-search_2867938.png.png"), Settings(name: "Feedback", imageName: "iconfinder_icon-search_2867938.png.png"), Settings(name: "Help", imageName: "iconfinder_icon-search_2867938.png.png"), Settings(name: "SwitchAccount", imageName: "iconfinder_icon-search_2867938.png.png"), Settings(name: "Cancel", imageName: "iconfinder_icon-search_2867938.png.png")]
    }()
    var homeController: HomeController?
   func show(){
        
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            let height: CGFloat = cellHeight * CGFloat(settings.count)
            let y = window.frame.height - height
                
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
            
            
       
            
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        let settings = self.settings[indexPath.item]
        cell.settings = settings
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = settings[indexPath.item]
        handleDismiss()
        if setting.name != "" && setting.name != "Cancel"
        {
            homeController?.showControllerForSetting(setting: setting)
        }
        
        
    }
    @objc func handleDismiss () {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
            
        }
    }
    
    
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    
    
}
