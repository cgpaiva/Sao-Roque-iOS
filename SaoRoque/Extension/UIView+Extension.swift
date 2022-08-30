//
//  UIView+Extension.swift
//  SaoRoque
//
//  Created by Gabriel on 28/08/22.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
}
