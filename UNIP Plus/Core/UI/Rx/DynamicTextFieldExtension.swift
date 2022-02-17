//
//  DynamicTextFieldExtension.swift
//  UNIP Plus
//
//  Created by José Franklin Silva Alves on 05/02/22.
//

import UIKit

extension UITextField {
    
    var rx: DynamicObject<String> {
        if let value = objc_getAssociatedObject(self, "rx") as? DynamicObject<String> {
            return value
        }
        
        let value = DynamicObject<String>()
        objc_setAssociatedObject(self, "rx", value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return value
    }
    
    func bindText(_ dynamicObject: DynamicObject<String>) {
        dynamicObject.subscribe(next: { [weak self] value in
            guard let self = self else { return }
            self.text = value
        })
        
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
    }
    
    @objc private func editingChanged() {
        
    }
    
}
