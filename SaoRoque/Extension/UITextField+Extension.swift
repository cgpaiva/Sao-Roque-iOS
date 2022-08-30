//
//  UITextField+Extension.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import Foundation
import UIKit

extension UITextField {
    class func configReturnKeyType(fields:[UITextField]) -> Void {
            guard let last = fields.last else {
                return
            }
            for i in 0 ..< fields.count - 1 {
                fields[i].returnKeyType = .next
                fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
            }
            last.returnKeyType = .go
            last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
        }
}

