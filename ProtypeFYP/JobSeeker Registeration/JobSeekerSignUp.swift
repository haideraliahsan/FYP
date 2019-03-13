//
//  JobSeekerSignUp.swift
//  ProtypeFYP
//
//  Created by haider ali on 21/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class JobSeekerSignUp: UIViewController {
    
    @IBOutlet weak var instituteCountry: UITextField!
    @IBOutlet weak var institute: UITextField!
    @IBOutlet weak var education: UITextField!
    
    
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var nationality: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    
    @IBOutlet weak var skills: UITextField!
    @IBOutlet weak var months: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var deswignation: UITextField!
    
    @IBOutlet weak var passConfrm: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fullName: UITextField!
    
    
    @IBOutlet weak var containerView4: UIView!
    
    @IBOutlet weak var containerView1: UIView!
    
    @IBOutlet weak var containerView2: UIView!
    
    @IBOutlet weak var containerView3: UIView!
    
    
    
    @IBOutlet weak var btnContinue: UIButton!
    
    
    @IBAction func actionContinue(_ sender: UIButton) {
        if index == 0
        {
           
            index = 1
        }
        if index == 1
        {
            containerView1.alpha = 0
            containerView2.alpha = 1
            containerView3.alpha = 0
            containerView4.alpha = 0
//            btnContinue.isEnabled = false
            index = 2
            
            
        }
        else if index == 2
        {
            containerView1.alpha = 0
            containerView2.alpha = 0
            containerView3.alpha = 1
            containerView4.alpha = 0
//            btnContinue.isEnabled = false
            index = 3
        }
        else if index == 3
        {
            containerView1.alpha = 0
            containerView2.alpha = 0
            containerView3.alpha = 0
            containerView4.alpha = 1
//            btnContinue.isEnabled = false
            index = 4
        }
        else if index == 4
        {
            //move to the show interface
            showInterface()
        }
        disableButton ()
        
        
    }
    var index: Int?
    
    
    
    
    func disableButton () {
        if btnContinue.isEnabled
        {
            btnContinue.tintColor = UIColor.black
        }
        else
        {
            btnContinue.tintColor = UIColor.black
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = fullName.text
        let emailText = email.text
        let password = pass.text
        let passCOnfirm = passConfrm.text
        
        if (name?.isEmpty)! || (emailText?.isEmpty)! || (password?.isEmpty)! || (passCOnfirm?.isEmpty)! {
            
        }else{
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = 0
        self.hideKeyboardWhenTappedAround()
        btnContinue.tintColor = UIColor.black
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
