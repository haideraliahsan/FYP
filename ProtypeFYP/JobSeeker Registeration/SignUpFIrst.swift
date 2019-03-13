//
//  SignUpFIrst.swift
//  ProtypeFYP
//
//  Created by haider ali on 21/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class SignUpFIrst: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var passConfirm: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fullName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()

        // Do any additional setup after loading the view.
    }
    func btnDisable () {
    
            btn1.isEnabled = false
        btn1.tintColor = UIColor.white

    }
    func enableBtn () {
        
        btn1.isEnabled = true
        btn1.setTitleColor(.black, for: .normal)
    }
    func checkTextFeilds() {
       fullName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        email.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        pass.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       passConfirm.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = fullName.text
        let emailText = email.text
        let password = pass.text
        let passwordCon = passConfirm.text
        if (name?.isEmpty)! || (emailText?.isEmpty)! || (password?.isEmpty)! || (passwordCon?.isEmpty)! || passwordCon != password || !isValidEmail(testStr: emailText!)  {
            btnDisable()
        }
        else
        {
            enableBtn()
        }
    }
    

    @IBAction func actionBrn1(_ sender: UIButton) {
        self.performSegue(withIdentifier: "continue12", sender: self)
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
