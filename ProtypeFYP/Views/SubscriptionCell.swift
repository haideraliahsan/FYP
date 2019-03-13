//
//  SubscriptionCell.swift
//  DemoYoutube
//
//  Created by haider ali on 01/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
//        ApiService.sharedInstance.fetchSubscriptionFeed(completion: { (videos) in
//            self.videos = videos
//            self.collectionView.reloadData()
//        }) 
    }
    let subCellId = "cellId"
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subCellId, for: indexPath) as? JobCell
        cell?.job = jobSubscriptions[indexPath.item]
        return cell!
        
    }
    var jobSubscriptions: [Job] = {
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
        
        return [moreBlankSpace,moreBadBlood, blankSpace, badBlood]
    }()
    
    
}
