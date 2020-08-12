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

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AuthenticationViewModel()

        // Do any additional setup after loading the view.
    }
    
    private func setupRx() {
        
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
