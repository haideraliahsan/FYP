//
//  SignUpForth.swift
//  ProtypeFYP
//
//  Created by haider ali on 21/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class SignUpForth: UIViewController {

    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var institute: UITextField!
    @IBOutlet weak var education: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func btnDisable () {
        
        btn4.isEnabled = false
        btn4.tintColor = UIColor.white
        
    }
    func enableBtn () {
        
        btn4.isEnabled = true
        btn4.setTitleColor(.black, for: .normal)
    }
    func checkTextFeilds() {
        country.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        institute.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        education.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = country.text
        let emailText = institute.text
        let password = education.text
     
        
        
        if (name?.isEmpty)! || (emailText?.isEmpty)! || (password?.isEmpty)!     {
            btnDisable()
        }
        else
        {
            enableBtn()
        }
    }
    
    
    
    @IBAction func actionBtn4(_ sender: UIButton) {
        showInterface()

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
