//
//  LoginViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController<LoginCoordinator, LoginViewModel> {
    @IBOutlet private weak var raTF: UITextField?
    @IBOutlet private weak var passwordTF: UITextField?
    
    let credentials = ["ra": "c85ebc8", "password": "2710"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        coordinator?.showHome()
    }
    
    @IBAction func enterAction(_ sender: Any) {
//        viewModel?.performLoginWithCredentials(credentials)
        
    }
    
    @IBAction func switchTheme(_ sender: UISwitch) {
//        let theme = BackgroudView.appearance
        
        if sender.isOn {
        } else {
            
        }
        
        self.loadView()
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    
    func showAlert(message: String) {
        coordinator?.showAlertWithMessage(message)
    }
    
    func userLogged(_ userInfo: UserInfo?) {
        coordinator?.showHome()
    }
    
}
