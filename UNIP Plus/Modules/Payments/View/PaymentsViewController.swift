//
//  PaymentsViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class PaymentsViewController: BaseViewController<PaymentsViewModel> {
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Pagamentos"
        viewModel.delegate = self
        registerCells()
    }
    
    private func registerCells() {
        table?.registerCell(PaymentCell.self)
        table?.registerHeaderFooter(PaymentsSectionView.self)
    }

}

extension PaymentsViewController {
    
}

extension PaymentsViewController: PaymentsViewModelDelegate {
    func error(message: String) {
        
    }
    
    func fetchPaymentsFinished() {
        table?.reloadData()
    }
    
}
