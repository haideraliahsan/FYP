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
        ApiService.sharedInstance.fetchSubscriptionFeed(completion: { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }) 
    }
}
