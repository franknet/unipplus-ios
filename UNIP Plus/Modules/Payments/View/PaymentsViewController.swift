//
//  PaymentsViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class PaymentsViewController: BaseViewController<HomeCoordinator, PaymentsViewModel> {
    @IBOutlet weak var table: BaseUITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Pagamentos"
        table?.tableDelegate = self
        viewModel?.delegate = self
        registerCells()
    }
    
    private func registerCells() {
        table?.registerCell(PaymentCell.self)
        table?.registerHeaderFooter(PaymentsSectionView.self)
    }

}

extension PaymentsViewController: BaseUITableViewDelegate {
    
    func numberOfSections() -> Int {
        guard let info = viewModel?.paymentsInfo, let paymentsGroup = info.payments else { return 0 }
        return paymentsGroup.count
    }
    
    func viewForHeaderInSection(_ section: Int) -> UIView? {
        let paymentsGroup = viewModel?.paymentsInfo!.payments![section]
        let view = table?.dequeueHeaderFooterView(PaymentsSectionView.self)
        view?.title?.text = paymentsGroup?.name
        return view
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        guard
            let info = viewModel?.paymentsInfo,
            let paymentsGroup = info.payments,
            let payments = paymentsGroup[section].payments
        else { return 0 }
        return payments.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> UITableViewCell {
        let payment = viewModel?.paymentsInfo!.payments![indexPath.section].payments![indexPath.row]
        let cell = table?.dequeueCell(PaymentCell.self)
        cell?.textLabel?.text = payment?.maturity_dt
        return cell!
    }
    
    func didSelectCellAt(_ indexPath: IndexPath) {
        
    }
    
    
}

extension PaymentsViewController: PaymentsViewModelDelegate {
    func error(message: String) {
        coordinator?.showAlertWithMessage(message)
    }
    
    func fetchPaymentsFinished() {
        table?.reloadData()
    }
    
}
