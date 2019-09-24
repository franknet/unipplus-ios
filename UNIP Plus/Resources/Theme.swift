//
//  Theme.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 23/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

class Theme {
    
    static func apply() {
        UIPageControlTheme()
    }
    
    static func applyDark() {
        UIViewDarkTheme()
        UIPageControlDarkTheme()
        UITextFieldDarkTheme()
        
        reloadViews()
    }
    
    private static func UIPageControlTheme() {
        let theme = UIPageControl.appearance()
        theme.currentPageIndicatorTintColor = .black
        theme.pageIndicatorTintColor = .darkGray
    }
    
    private static func UIPageControlDarkTheme() {
        let theme = UIPageControl.appearance()
        theme.currentPageIndicatorTintColor = .white
        theme.pageIndicatorTintColor = .darkGray
    }
    
    private static func UIViewDarkTheme() {
        let theme = UIView.appearance()
        theme.backgroundColor = .black
    }
    
    private static func UITextFieldDarkTheme() {
        let theme = UITextField.appearance()
        theme.backgroundColor = .darkGray
        theme.textColor = .white
    }
    
    
    
    private static func reloadViews() {
        let windows = UIApplication.shared.windows
        for window in windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
    }
    
    
}
