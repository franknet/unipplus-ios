//
//  AuthenticationViewController.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 02/02/22.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    let viewModel: AuthenticationViewModel
    
    required init(withViewModel viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
