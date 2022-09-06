//
//  SigninViewController.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import UIKit

protocol NewAccountDelegate {
    func didSuccessCreateAccount()
}

class SigninViewController: UIViewController {
    
    private var service: AccountServiceProtocol?
    private var currentNavigationController: UINavigationController?
    var newAccountDelegate: NewAccountDelegate?
    
    init(service: AccountServiceProtocol = AccountService(), navigationController: UINavigationController) {
        self.service = service
        self.currentNavigationController = navigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    override func loadView() {
        let signinView = SigninView()
        signinView.viewModel = SigninViewModel()
        signinView.delegate = self
        self.view = signinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
}

extension SigninViewController: SigninDelegate {
    
    func createAccount(user: UserModel) {
        service?.fetchNewAccount(user: user, completion: { result in
            switch result {
            case .success(_):
                self.dismiss(animated: true)
                self.newAccountDelegate?.didSuccessCreateAccount()
            case .failure(let error):
                let currentView = self.view as? SigninView
                currentView?.hideLoading()
                AppSnackBar.make(in: self.view, message: error.localizedDescription, duration: .lengthShort).show()
            }
        })
    }
    
    
}
