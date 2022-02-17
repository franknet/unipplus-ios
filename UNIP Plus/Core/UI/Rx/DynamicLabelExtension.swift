//
//  DynamicLabelExtension.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 05/02/22.
//

import UIKit

extension UILabel {
    
    func bindText(_ dynamicObject: DynamicObject<String>) {
        dynamicObject.subscribe(next: { [weak self] value in
            guard let self = self else { return }
            self.text = value
        })
    }
    
    
    
}
