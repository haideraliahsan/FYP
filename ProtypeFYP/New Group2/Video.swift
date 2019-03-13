//
//  Video.swift
//  DemoYoutube
//
//  Created by haider ali on 26/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbNailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
    
}
class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
