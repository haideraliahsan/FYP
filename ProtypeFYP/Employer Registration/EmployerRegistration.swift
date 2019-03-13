//
//  EmployerRegistration.swift
//  ProtypeFYP
//
//  Created by haider ali on 07/12/2018.
//  Copyright © 2018 haider ali. All rights reserved.
//

import UIKit

class EmployerRegistration: UIViewController {
    
    
    @IBOutlet weak var fullNameTextFeild: UITextField!
    
    @IBOutlet weak var countryCode: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBOutlet weak var nameOrganizationTextFeild: UITextField!
    
    @IBAction func registerBtn(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "signupsegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()


        // Do any additional setup after loading the view.
    }
    

    

}
