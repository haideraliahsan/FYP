//
//  ApiService.swift
//  DemoYoutube
//
//  Created by haider ali on 30/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    
    func fetchVideos (completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json") { (videos) in
            completion(videos)
        }
        
        
        
    }
    
    func fetchTrendingFeed (completion: @escaping ([Video]) -> ()) {
        
        
        
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
        
        
    }
    func fetchSubscriptionFeed (completion: @escaping ([Video]) -> ()) {
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    func fetchFeedForUrlString (urlString: String,completion: @escaping ([Video]) -> ()) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print(error)
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
                    let channelDictionary  = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.profileImageName = channelDictionary["profile_image_name"] as! String
                    channel.name = channelDictionary["name"] as! String
                    video.channel = channel
                    
                    videos.append(video)
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        completion(videos)
                        //       self.collectionView?.reloadData()
                    }
                }
                
                
                
            }catch let jsonErr{
                print(jsonErr)
            }
            
            }.resume()
        
    }
    
    
    

}
