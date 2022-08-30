//
//  LoginViewModel.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import Foundation
import UIKit

protocol LoginViewModelProtocol {
    var emailTextFieldAttributedString: NSAttributedString { get }
    var passwordTextFieldAttributedString: NSAttributedString { get }
}

class LoginViewModel: LoginViewModelProtocol {
    var emailTextFieldAttributedString: NSAttributedString
    var passwordTextFieldAttributedString: NSAttributedString
    
    init() {
        let lightGrayColor = UIColor(named: "lightGray")
        emailTextFieldAttributedString = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: lightGrayColor as Any]
        )
        
        passwordTextFieldAttributedString = NSAttributedString(
            string: "Senha",
            attributes: [NSAttributedString.Key.foregroundColor: lightGrayColor as Any]
        )
    }
    
}
