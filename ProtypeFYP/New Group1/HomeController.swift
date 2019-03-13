//
//  ViewController.swift
//  DemoYoutube
//
//  Created by haider ali on 18/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    
    let cellId = "cellId"
    let trendingCellId = "trendingCellId"
    let subscriptionCellId = "subscriptionCellId"
    
    let titles = ["Home" ,"Trending" , "Subscriptions", "Account"]
    
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
      
        
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
        
        
        
        
    }
    
    func setupCollectionView () {
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
//        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
 //      collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellId)


        collectionView?.backgroundColor = UIColor.white
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.isPagingEnabled = true
        
    }
    
    func setupNavBarButtons(){
        let searchImage = UIImage(named: "iconfinder_icon-search_2867938.png.png")?.withRenderingMode(.alwaysOriginal)
        
        let searchButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
    
        let moreBarButton = UIBarButtonItem(image: UIImage(named: "iconfinder_ic_more_vert_48px_352549.")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMoreButton))
        
        navigationItem.rightBarButtonItems = [moreBarButton, searchButtonItem]
        
        
    }
    lazy var settingsLauncher: LauncherSettings = {
    let launcher = LauncherSettings()
        launcher.homeController = self
        return launcher
    }()
    
    
    @objc func handleMoreButton(){
        
        settingsLauncher.show()

    }
    
    func scrollToMenuIndex(menuIndex: Int)
    {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
        setTitlesForIndex(index: menuIndex)
    }
    
    func showControllerForSetting (setting: Settings) {
        let dummyViewController = UIViewController()
        navigationController?.pushViewController(dummyViewController, animated: true)
        dummyViewController.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = UIColor.white
        dummyViewController.view.backgroundColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
        
    }

    @objc func handleSearch(){
        
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    private func setupMenuBar (){
        
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstrintWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstrintWithFormat(format: "V:[v0(50)]", views: redView)

        
        
        view.addSubview(menuBar)
        view.addConstrintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstrintWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        
        if indexPath.item == 1 {
            identifier = trendingCellId
        }else if indexPath.item == 2
        {
            identifier = subscriptionCellId
        }else {
            identifier = cellId
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)

        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
        
        
    }
    
    private func setTitlesForIndex(index: Int){
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[index])"
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        setTitlesForIndex(index: Int(index))
        
    }
    
    
    
    
    
    
    
    
    
    


}


