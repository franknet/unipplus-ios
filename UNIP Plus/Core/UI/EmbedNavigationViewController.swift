//
//  EmbedNavigationViewController.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 01/02/22.
//

import UIKit

class EmbedNavigationViewController: UIViewController {
    
    private let rootViewController: UIViewController
    
    private var embedNavigationController: UINavigationController
    
    required init(rootViewController: UIViewController, _ embedNavigationController: UINavigationController = UINavigationController()) {
        self.rootViewController = rootViewController
        self.embedNavigationController = embedNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedNavigationController.pushViewController(rootViewController, animated: false)
        
        embedNavigationController.willMove(toParent: self)
        embedNavigationController.view.frame = view.frame
        view.addSubview(embedNavigationController.view)
        embedNavigationController.didMove(toParent: self)
    }
    
}
