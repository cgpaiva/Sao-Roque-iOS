//
//  ViewController.swift
//  SaoRoque
//
//  Created by Gabriel on 28/08/22.
//

import UIKit
import BottomSheet

class LoginViewController: UIViewController {
    
    override func loadView() {
        let view = LoginView()
        view.viewModel = LoginViewModel()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }


}

extension LoginViewController: LoginViewDelegate {
    func signin() {
        
      var signinModal = SigninViewController()
        
        signinModal.modalPresentationStyle = .overCurrentContext
        
        self.present(signinModal, animated: true)
      
    }
}
