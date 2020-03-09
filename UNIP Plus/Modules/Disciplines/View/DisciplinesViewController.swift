//
//  GradesViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class DisciplinesViewController: BaseViewController<DisciplinesViewModel> {
    @IBOutlet weak var table: BaseUITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Notas e Faltas"
        viewModel.delegate = self
        setTableView()
    }
    
    private func setTableView() {
        table.registerCell(DisciplineCell.self)
        table.registerHeaderFooter(DisciplinesSectionView.self)
        table.registerHeaderFooter(SemesterStatusView.self)
        tableCalls()
    }

}

extension DisciplinesViewController {
    func tableCalls() {
        table.numberOfSections {
            return 2
        }
        table.numberOfRowsInSection { section in
            return 4
        }
        table.viewForHeaderInSection { tableView, section in
            return tableView.dequeueReusableHeaderFooterView(DisciplinesSectionView.self) { view in
                
            }
        }
        table.cellForRowAt { tableView, indexPath in
            return tableView.dequeueReusableCell(DisciplineCell.self) { cell in
                
            }
        }
        table.didSelectCellAt { indexPath in
            
        }
    }
}

extension DisciplinesViewController: DisciplinesViewModelDelegate {
    // MARK: GradesViewModelDelegate
    
    func error(message: String) {
        
    }
    
    func fetchGradesFinished() {
        table.reloadData()
    }
}
