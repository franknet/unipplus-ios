//
//  LoginViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController<LoginViewModel> {
    @IBOutlet private weak var raTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enterAction() {
        viewModel.performLogin(ra: raTF.text, password: passwordTF.text)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    
}
