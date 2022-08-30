//
//  SigninViewController.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import UIKit

class SigninViewController: UIViewController {
    
    override func loadView() {
        let view = SigninView()

        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
}
