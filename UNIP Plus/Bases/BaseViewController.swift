//
//  BaseViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 19/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel.viewDidLoad != nil else { return }
        viewModel.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard viewModel.viewWillAppear != nil else { return }
        viewModel.viewWillAppear?()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard viewModel.viewWillDisappear != nil else { return }
        viewModel.viewWillDisappear?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
