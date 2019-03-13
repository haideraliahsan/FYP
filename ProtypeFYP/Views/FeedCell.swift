//
//  FeedCell.swift
//  DemoYoutube
//
//  Created by haider ali on 01/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        
        return cv
        
    }()
    
    var job: [Job] = {
        var blankSpace = Job()
        blankSpace.title = "Software Project Manger Job - "
        blankSpace.thumbNailImageName = "job1"
        blankSpace.numberOfViews = 48123845618974
        blankSpace.channel?.profileImageName = "profileImage"
        blankSpace.channel?.name = "Estimation Engineer Job Location : UAE Job Details :Estimating & costing of projects and tenders. Preparation of estimates and costs for projects and tenders, maintaining cost data base, material schedule, Bill of quantities. Analyze drawing and Technical specifications."
        
        var badBlood = Job()
        badBlood.title = "IOS Developer Job"
        badBlood.thumbNailImageName = "job2"
        badBlood.numberOfViews = 8556848123845618
        badBlood.channel?.profileImageName = "profileImage"
        badBlood.channel?.name = "Estimation Engineer Job Location : UAE Job Details :Estimating & costing of projects and tenders. Preparation of estimates and costs for projects and tenders, maintaining cost data base, material schedule, Bill of quantities. Analyze drawing and Technical specifications."

        
        var moreBlankSpace = Job()
        moreBlankSpace.title = "Android Application Developement Job "
        moreBlankSpace.thumbNailImageName = "job3"
        moreBlankSpace.numberOfViews = 7897615681515
        moreBlankSpace.channel?.profileImageName = "profileImage"
        moreBlankSpace.channel?.name = "Estimation Engineer Job Location : UAE Job Details :Estimating & costing of projects and tenders. Preparation of estimates and costs for projects and tenders, maintaining cost data base, material schedule, Bill of quantities. Analyze drawing and Technical specifications."

        var moreBadBlood = Job()
        moreBadBlood.title = "IOS Developer Job"
        moreBadBlood.thumbNailImageName = "job4"
        moreBadBlood.numberOfViews = 489415684941651
        moreBadBlood.channel?.profileImageName = "profileImage"
        moreBadBlood.channel?.name = "Estimation Engineer Job Location : UAE Job Details :Estimating & costing of projects and tenders. Preparation of estimates and costs for projects and tenders, maintaining cost data base, material schedule, Bill of quantities. Analyze drawing and Technical specifications."

        return [blankSpace, badBlood, moreBadBlood, moreBlankSpace]
    }()
        
    
    let cellId = "cellId"
    
    override func setupViews() {
        fetchVideos()
        addSubview(collectionView)
        addConstrintWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrintWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(JobCell.self, forCellWithReuseIdentifier: cellId)

    }
    func fetchVideos(){
        
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return job.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? JobCell
        cell?.job = job[indexPath.item]
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16 ) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 68)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
//     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return job.count
//    }
//     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! JobCell
//        cell.job = job[indexPath.item]
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (frame.width - 16 - 16 ) * 9 / 16
//        return CGSize(width: frame.width, height: height + 16 + 68)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let videoLauncher = VideoLauncher()
//        videoLauncher.showVideoPlayer()
//    }

    

