//
//  SignUpThird.swift
//  ProtypeFYP
//
//  Created by haider ali on 21/01/2019.
//  Copyright © 2019 haider ali. All rights reserved.
//

import UIKit

class SignUpThird: UIViewController {
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var nationality: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btnDisable ()
        checkTextFeilds ()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    func btnDisable () {
        
        btn3.isEnabled = false
        btn3.tintColor = UIColor.white
        
    }
    func enableBtn () {
        
        btn3.isEnabled = true
        btn3.setTitleColor(.black, for: .normal)
    }
    func checkTextFeilds() {
        city.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        number.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        countryCode.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        nationality.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
      
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let name = city.text
        let emailText = city.text
        let password = number.text
        let passwordCon = countryCode.text
        let abc = nationality.text
        
       
        if (name?.isEmpty)! || (emailText?.isEmpty)! || (password?.isEmpty)! || (passwordCon?.isEmpty)! || (abc?.isEmpty)!   {
            btnDisable()
        }
        else
        {
            enableBtn()
        }
    }
    
    
    
    
    
    
    
    @IBAction func actionBtn3(_ sender: UIButton) {
        self.performSegue(withIdentifier: "continue34", sender: self)
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
