//
//  FinanceViewModel.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import Foundation

protocol FinanceViewModelDelegate: AnyObject {
    
}

class FinanceViewModel {
    
    weak var delegate: FinanceViewModelDelegate?
    var error = DynamicObject<RestError>()
    var payments =  DynamicObject<Payments>()
    var bankSlipPDFData = DynamicObject<Data>()
    
    func loadData() {
        let completioinHandler: ((Result<Payments, RestError>) -> Void) = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let payments):
                self.payments.value = payments
            case .failure(let error):
                self.error.value = error
            }
        }
        
        FinanceAPIProvider.payments.fetch(modelType: Payments.self, completioinHandler)
    }
    
    func downloadBankSlipFromPayment(_ payment: Payment) {
        guard let path = payment.bankSlipUrl else { return }
        
        let completioinHandler: ((Result<Data, RestError>) -> Void) = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let bankSlipPDFData):
                self.bankSlipPDFData.value = bankSlipPDFData
            case .failure(let error):
                self.error.value = error
            }
        }
        
        FinanceAPIProvider.downloadBankSlip(path: path).fetch(completioinHandler)
    }
}
