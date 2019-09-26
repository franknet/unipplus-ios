//
//  GradesViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class GradesViewController: BaseViewController<HomeCoordinator, GradesViewModel> {
    @IBOutlet private weak var table: BaseUITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Notas e Faltas"
        viewModel?.delegate = self
        setTableView()
    }
    
    private func setTableView() {
        table?.tableDelegate = self
        table?.registerCell(GradeCell.self)
        table?.registerHeaderFooter(GradesSectionView.self)
    }

}

extension GradesViewController: GradesViewModelDelegate {
    // MARK: GradesViewModelDelegate
    
    func error(message: String) {
        coordinator?.showAlertWithMessage(message)
    }
    
    func fetchGradesFinished() {
        table?.reloadData()
    }
}

extension GradesViewController: BaseUITableViewDelegate {
    // MARK: BaseUITableViewDelegate
    
    func numberOfSections() -> Int {
        guard let info = viewModel?.gradesInfo, let groups = info.grades else { return 0 }
        return groups.count
    }
    
    func viewForHeaderInSection(_ section: Int) -> UIView? {
        let group = viewModel?.gradesInfo?.grades![section]
        let view = table?.dequeueHeaderFooterView(GradesSectionView.self)
        view?.title?.text = group?.name
        return view
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        guard
            let info = viewModel?.gradesInfo,
            let groups = info.grades,
            let grades = groups[section].grades
        else { return 0 }
        return grades.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> UITableViewCell {
        let grade = viewModel?.gradesInfo?.grades![indexPath.section].grades![indexPath.row]
        
        let cell = table?.dequeueCell(GradeCell.self)
        cell?.textLabel?.text = grade?.name
        return cell!
    }
    
    func didSelectCellAt(_ indexPath: IndexPath) {
        
    }
    
    
}

