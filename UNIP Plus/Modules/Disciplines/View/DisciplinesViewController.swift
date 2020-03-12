//
//  GradesViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class DisciplinesViewController: BaseViewController<DisciplinesViewModel> {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        setup()
        viewModel.fetchDisciplines()
    }
    
    private func setup() {
        title = "Notas e Faltas"
        viewModel.delegate = self
        setTableView()
    }
    
    private func setTableView() {
        table.dataSource = self
        table.delegate = self
        table.registerCell(DisciplineCell.self)
        table.registerHeaderFooter(DisciplinesSectionView.self)
        table.registerHeaderFooter(SemesterStatusView.self)
    }
}

extension DisciplinesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groupsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.disciplinesCountAt(section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(SemesterStatusView.self) { [weak self] view in
                guard let self = self else { return }
                view.setStatus(self.viewModel.disciplinesStatus)
            }
        } else {
            return tableView.dequeueReusableHeaderFooterView(DisciplinesSectionView.self) { [weak self] view in
                guard let self = self else { return }
                view.setDisciplinesGroup(self.viewModel.disciplinesGroupAt(section))
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return table.dequeueReusableCell(DisciplineCell.self) { [weak self] cell in
            guard let self = self else { return }
            cell.setDiscipline(self.viewModel.disciplineAt(indexPath))
        }
    }
}

extension DisciplinesViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
}

extension DisciplinesViewController: DisciplinesViewModelDelegate {
    func reloadTable() {
        table.reloadData()
    }
}
