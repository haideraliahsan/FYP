//
//  extensions.swift
//  DemoYoutube
//
//  Created by haider ali on 19/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
extension UIView{
    func addConstrintWithFormat (format: String, views: UIView...)
    {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
        
    }
}
let imageCache = NSCache<AnyObject, AnyObject>()
class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(UrlString: String){
        imageUrlString = UrlString
        let url = URL(string: UrlString)
        image = nil
        if let imageFromCache = imageCache.object(forKey: UrlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
            
        }
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    if self.imageUrlString == UrlString
                    {
                        self.image = imageToCache

                    }
                    imageCache.setObject(imageToCache!, forKey: UrlString as AnyObject)
                    
                }
            }
            
            }.resume()
    }
    
    
    
    
}




