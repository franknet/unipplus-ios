//
//  AuthenticationViewController.swift
//  UNIPPlus
//
//  Created by Jose Franklin da Silva Alves on 12/08/20.
//  Copyright © 2020 Mobile Class. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AuthenticationViewController: BaseViewController {
    private var viewModel: AuthenticationViewModel!
    private let dispose = DisposeBag()
    private let keyboardManage = KeyboardManager()
    
    @IBOutlet weak private var raTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AuthenticationViewModel()
        keyboardManage.start()
        setupRx()
    }
    
    private func setupRx() {
        raTextField.rx.text.orEmpty.bind(to: viewModel.ra).disposed(by: dispose)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: dispose)
        submitButton.rx.tap.bind(to: viewModel.submit).disposed(by: dispose)
        
        viewModel.isSubmitEnabled.bind(to: submitButton.rx.isEnabled).disposed(by: dispose)
        viewModel.isSubmitEnabled.map({ $0 ? 1.0 : 0.3 }).bind(to: submitButton.rx.alpha).disposed(by: dispose)
        viewModel.errorMessage.bind(to: rx.alertMassage).disposed(by: dispose)
        
        keyboardManage.keyboard.bind(to: rx.animateShowKeyboard).disposed(by: dispose)
    }

}

