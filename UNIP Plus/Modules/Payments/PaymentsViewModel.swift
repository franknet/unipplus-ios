//
//  PaymentsViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol PaymentsViewModelDelegate {
    func error(message: String)
    func fetchPaymentsFinished()
}

class PaymentsViewModel: BaseViewModel {
    var delegate: PaymentsViewModelDelegate?
    var paymentsInfo: PaymentsInfo?
    
    func viewDidLoad() {
        
    }
    
    private func fetchPaymentss() {
        
    }
    
}
