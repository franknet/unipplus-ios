//
//  MenuViewController.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 24/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    func logout()
    func share()
}

class MenuViewController: UIViewController {
    @IBOutlet private var container: UIView?
    @IBOutlet private var topConstraint: NSLayoutConstraint?
    
    var delegate: MenuViewControllerDelegate?
    
    enum Options: Int {
        case Share = 2
        case Logout = 1
        case Exit = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setup() {
        setInitalPosition()
        setShowMenuAction()
    }
    
    private func setInitalPosition() {
        guard let size = container?.frame.size else { return }
        topConstraint?.constant = size.height * -1
        self.view.layoutIfNeeded()
    }
    
    private func setShowMenuAction() {
        perform(#selector(showMenu), with: nil, afterDelay: 0.2)
    }
    
    private func setOutSideTouchAction() {
        
    }
    
    // MARK: Actions
    @objc func showMenu() {
        topConstraint?.constant = 0
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func touchOutSide() {
        
    }
    
    @IBAction func menuAction(_ sender: UIButton) {
        guard let size = container?.frame.size else { return }
        topConstraint?.constant = size.height * -1
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }) { (finised) in
            
            switch Options(rawValue: sender.tag) {
            case .Share:
                self.dismiss(animated: true) {
                    self.delegate!.share()
                }
            case .Logout:
                self.dismiss(animated: true) {
                    self.delegate!.logout()
                }
            case .Exit:
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        
    }
}
