//
//  EmployerLogin.swift
//  ProtypeFYP
//
//  Created by haider ali on 07/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class EmployerLogin: UIViewController {

    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBAction func signInBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signinsegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    func btnDisable () {
        
        signInBtn.isEnabled = false
        signInBtn.tintColor = UIColor.white
        
    }
    func enableBtn () {
        
        signInBtn.isEnabled = true
        signInBtn.setTitleColor(.black, for: .normal)
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
