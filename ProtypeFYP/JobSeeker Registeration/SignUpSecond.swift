//
//  SignUpSecond.swift
//  ProtypeFYP
//
//  Created by haider ali on 21/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class SignUpSecond: UIViewController {
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var company: UITextField!
    
    @IBOutlet weak var skills: UITextField!
    @IBOutlet weak var months: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var designation: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()
        // Do any additional setup after loading the view.
    }
    

    
    
    
    func btnDisable () {
        
        btn2.isEnabled = false
        btn2.tintColor = UIColor.white

    }
    func enableBtn () {
        
        btn2.isEnabled = true
        btn2.setTitleColor(.black, for: .normal)
    }
    func checkTextFeilds() {
        company.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        skills.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        months.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        year.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        city.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        designation.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = designation.text
        let emailText = city.text
        let password = year.text
        let passwordCon = months.text
        let abc = skills.text
        let def = company.text
        if (name?.isEmpty)! || (emailText?.isEmpty)! || (password?.isEmpty)! || (passwordCon?.isEmpty)! || (abc?.isEmpty)! || (def?.isEmpty)!  {
            btnDisable()
        }
        else
        {
            enableBtn()
        }
    }
    
    
    
    
    
    
    @IBAction func actionBtn2(_ sender: UIButton) {
        self.performSegue(withIdentifier: "continue23", sender: self)
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
