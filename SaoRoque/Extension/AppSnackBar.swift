//
//  AppSnackBar.swift
//  SaoRoque
//
//  Created by Gabriel on 04/09/22.
//

import Foundation
import SnackBar
import UIKit

class AppSnackBar: SnackBar {
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = UIColor(named: "snackbarBackground") ?? .black
        style.textColor = .white
        return style
    }
}
