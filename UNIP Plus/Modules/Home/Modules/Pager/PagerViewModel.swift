//
//  PagerViewModel.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 24/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class PagerViewModel: BaseViewModel {
    var pageIndex = 0
    var viewControllers: [UIViewController]
    
    private var titles = ["Notas e Faltas", "Financeiro", "Histórico Acadêmico"]
    
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    func currentPageTitle() -> String {
        return titles[pageIndex]
    }
    
    func setPageIndexFromViewController(_ viewController: UIViewController) {
        pageIndex = viewControllers.firstIndex(of: viewController) ?? 0
    }
    
    func viewControllerBefore() -> UIViewController? {
        if pageIndex == 0 {
            return nil
        }
        pageIndex -= 1
        return viewControllers[pageIndex]
    }
    
    func viewControllerAfter() -> UIViewController? {
        pageIndex += 1
        
        if pageIndex == viewControllers.count {
            return nil
        }
        
        return viewControllers[pageIndex]
    }
    
}
