//
//  extensions.swift
//  DemoYoutube
//
//  Created by haider ali on 19/11/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit
import SQLite3

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
        
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
        
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

var db: OpaquePointer?


func databaseConnection (query: String) {
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("SQLDatabase.sqlite")
    if sqlite3_open(fileUrl.path, &db) != SQLITE_OK
    {
        print("error opening database")
        return
    }
    
    if sqlite3_exec(db, query, nil, nil, nil) != SQLITE_OK{
        print("error creating table")
        return
    }
    print("everything is fine")
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

var window: UIWindow?
func showInterface () {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    let layout = UICollectionViewFlowLayout()
    window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
    UINavigationBar.appearance().barTintColor = UIColor.darkGray
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    UINavigationBar.appearance().shadowImage = UIImage()
    let statusBarBackgroundView = UIView()
    statusBarBackgroundView.backgroundColor = UIColor.darkGray
    window?.addSubview(statusBarBackgroundView)
    window?.addConstrintWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
    window?.addConstrintWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
}




func insertionInDatabase () {
//    let name = fullNameTextFeild.text!
//    let email = emailTextFeild.text!
//    let pass = passwordTextFeildConfirm.text!
//    let passCon = passwordTextFeild.text!
//
//    var stmt: OpaquePointer!
//    // \(name), \(email), \(pass), \(passCon)
//    let insertQuery = "insert into JobSeekerSignUp (name, email, password, confirmPassword) values (?, ?, ?, ?)"
//    print(insertQuery)
//
//    if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK{
//        print("error binding query")
//    }
//    if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK {
//        print("error binding name")
//    }
//    if sqlite3_bind_text(stmt, 1, email, -1, nil) != SQLITE_OK {
//        print("error binding name")
//    }
//    if sqlite3_bind_text(stmt, 1, pass, -1, nil) != SQLITE_OK {
//        print("error binding name")
//    }
//    if sqlite3_bind_text(stmt, 1, passCon, -1, nil) != SQLITE_OK {
//        print("error binding name")
//    }
//    if sqlite3_step(stmt) == SQLITE_DONE {
//        print("saved successfully")
//
//    }
}
