//
//  GradesViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 20/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class GradesViewController: BaseViewController<PagerCoordinator, GradesViewModel> {
    @IBOutlet private weak var table: UITableView?
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        registerCells()
    }
    
    
    private func registerCells() {
        table?.registerCell(GradeCell.self)
        table?.registerHeaderFooter(GradesSectionView.self)
    }

}

extension GradesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GradeCell.self))
        
        
        return cell!
    }
    
    
}
