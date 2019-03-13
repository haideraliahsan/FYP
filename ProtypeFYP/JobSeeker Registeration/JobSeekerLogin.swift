//
//  JobSeekerLogin.swift
//  ProtypeFYP
//
//  Created by haider ali on 07/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class JobSeekerLogin: UIViewController {
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    

    var window: UIWindow?

    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBOutlet weak var signInbBtn: UIButton!
    @IBAction func signInBtn(_ sender: UIButton) {
        
       showInterface()
        
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
  
    func btnDisable () {
        
        signInbBtn.isEnabled = false
        signInbBtn.tintColor = UIColor.white
        
    }
    func enableBtn () {
        
        signInbBtn.isEnabled = true
        signInbBtn.setTitleColor(.black, for: .normal)
    }
    func checkTextFeilds() {
        emailTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextFeild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = emailTextFeild.text
        let emailText = passwordTextFeild.text
      
        if (name?.isEmpty)! || (emailText?.isEmpty)! || !isValidEmail(testStr: name!) {
            btnDisable()
        }
        else
        {
            enableBtn()
        }
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

