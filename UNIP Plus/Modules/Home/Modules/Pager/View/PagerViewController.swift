//
//  PagerViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 24/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class PagerViewController: BaseViewController<PagerCoordinator, PagerViewModel> {
    @IBOutlet private weak var contents: UIView?
    @IBOutlet private weak var pager: UIPageControl?
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        setPageViewController()
        setPageControl()
        setTabBarTitle()
        setRighMenuButton()
    }
    
    private func setRighMenuButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(menuAction))
    }
    
    private func setPageViewController() {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([(viewModel?.viewControllers.first)!], direction: .forward, animated: false, completion: nil)
        addViewController(pageVC, toView: contents!)
    }
    
    private func setPageControl() {
        pager?.numberOfPages = viewModel?.viewControllers.count ?? 0
    }
    
    private func setPagerControlIndex(_ index: Int) {
        pager?.currentPage = index
        setTabBarTitle()
    }
    
    private func setTabBarTitle() {
        title = viewModel?.currentPageTitle()
    }
    
    // MARK: Actions
    @objc private func menuAction() {
        coordinator!.homeCoordinator?.logout()
    }

}

extension PagerViewController: UIPageViewControllerDelegate {
    // MARK: UIPageViewController Delegate
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        viewModel?.setPageIndexFromViewController(pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        setPagerControlIndex(viewModel?.pageIndex ?? 0)
    }
}

extension PagerViewController: UIPageViewControllerDataSource {
    // MARK: UIPageViewController DataSource
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewModel?.viewControllers.count ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return viewModel?.viewControllerBefore()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return viewModel?.viewControllerAfter()
    }
    
}
