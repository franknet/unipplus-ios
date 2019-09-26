//
//  BaseUIPageView.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol BaseUIPageViewDelegate {
    func didFinishTransitionTo(viewController: UIViewController)
}

class BaseUIPageView: UIPageViewController {
    private var views: [UIViewController] = []
    private var index: Int = 0
    
    var pageDelegate: BaseUIPageViewDelegate?
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func commonInit() {
        self.delegate = self
        self.dataSource = self
    }
    
    func setViews(_ views: [UIViewController]) {
        self.views = views
        setViewControllers([self.views.first!], direction: .forward, animated: false, completion: nil)
        selectedView()
    }
    
    private func selectedView() {
        pageDelegate?.didFinishTransitionTo(viewController: views[index])
    }
    
}

extension BaseUIPageView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if index == 0 { return nil }
        index -= 1
        return views[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        index += 1
        if index == views.count { return nil }
        return views[index]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.views.count
    }
    
}

extension BaseUIPageView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        index = views.firstIndex(of: pendingViewControllers.first!) ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        selectedView()
    }
}
