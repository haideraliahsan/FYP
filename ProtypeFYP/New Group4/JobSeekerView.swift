//
//  JobSeekerView.swift
//  ProtypeFYP
//
//  Created by haider ali on 10/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

var window: UIWindow?

func launchJobSeekerView () {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let layout = UICollectionViewFlowLayout()
    window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
    
    navigationController?.navigationBar.tintColor = UIColor.darkGray
    UINavigationBar.appearance().barTintColor = UIColor.darkGray
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    UINavigationBar.appearance().shadowImage = UIImage()
    
    
    let statusBarBackgroundView = UIView()
    statusBarBackgroundView.backgroundColor = UIColor.darkGray
    
    
    window?.addSubview(statusBarBackgroundView)
    window?.addConstrintWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
    window?.addConstrintWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
}
