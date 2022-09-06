//
//  ViewController.swift
//  SaoRoque
//
//  Created by Gabriel on 28/08/22.
//

import UIKit
import BottomSheet
import MaterialComponents.MaterialBottomSheet
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let iphoneSeDeviceName = "iPhone8,4"
    
    override func loadView() {
        let view = LoginView()
        view.viewModel = LoginViewModel()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
//        verifyUserLogged()
    
    }
    
    func verifyUserLogged() {
        if Auth.auth().currentUser != nil {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }


}

extension LoginViewController: LoginViewDelegate {
    func signin() {
        
        let signinModal = SigninViewController(navigationController: self.navigationController ?? UINavigationController())
        
        signinModal.newAccountDelegate = self
    
        let bottomSheet = MDCBottomSheetController(contentViewController: signinModal)
        
        
        if UIDevice.current.modelName != iphoneSeDeviceName {
            bottomSheet.preferredContentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/2.3)
        }
        
        signinModal.modalPresentationStyle = .pageSheet
        
        self.present(bottomSheet, animated: true)
      
    }
}

extension LoginViewController: NewAccountDelegate {
    func didSuccessCreateAccount() {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    
}
