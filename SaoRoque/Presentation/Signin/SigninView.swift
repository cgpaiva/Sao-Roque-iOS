//
//  SigninView.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import UIKit
import SnackBar
import MHLoadingButton

protocol SigninDelegate {
    func createAccount(user: UserModel)
}

class SigninView: UIView {
    
    var newAccountLabel: UILabel
    var containerView: UIView
    var emailTextField: UITextField
    var emailIcon: UIImageView
    var passwordTextField: UITextField
    var emailLineView: UIView
    var passwordLineView: UIView
    var passwordIcon: UIImageView
    var signinButton: LoadingButton
    var delegate: SigninDelegate?
    var viewModel: SiginViewModelProtocol? {
        didSet {
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        newAccountLabel = UILabel()
        containerView = UIView()
        emailTextField = UITextField()
        passwordTextField = UITextField()
        emailIcon = UIImageView()
        emailLineView = UIView()
        passwordLineView = UIView()
        passwordIcon = UIImageView()
        signinButton = LoadingButton(text: "Confirmar", buttonStyle: .fill)
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func doCreateAccount(sender: LoadingButton) {
        
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        viewModel?.validateFields(email: emailText, password: passwordText, completion: { result in
            switch result {
            case .success(let user):
                sender.showLoader(userInteraction: false)
                self.delegate?.createAccount(user: user)
            case .failure(let error):
                AppSnackBar.make(in: self, message: error.domain, duration: .lengthShort).show()
                return
                
            }
        })
    }
    
    func hideLoading() {
        self.signinButton.hideLoader()
    }
    
}

extension SigninView: ViewCodable {
    func configHierarchy() {
        addSubviews(
            containerView
        )
        
        containerView.addSubviews(
            newAccountLabel, emailTextField,
            passwordTextField, emailIcon, emailLineView,
            passwordIcon, passwordLineView, signinButton
        )
    }
    
    func configConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        newAccountLabel.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.top.equalTo(40)
        }
        
        emailIcon.snp.makeConstraints { make in
            make.top.equalTo(newAccountLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.equalTo(emailIcon.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalTo(emailIcon.snp.centerY)
            make.height.equalTo(30)
        }
        
        emailLineView.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.top.equalTo(emailTextField.snp.bottom).offset(2)
            make.height.equalTo(1)
        }
        
        passwordIcon.snp.makeConstraints { make in
            make.top.equalTo(emailIcon.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalTo(passwordIcon.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalTo(passwordIcon.snp.centerY)
            make.height.equalTo(30)
        }
        
        passwordLineView.snp.makeConstraints { make in
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.top.equalTo(passwordTextField.snp.bottom).offset(2)
            make.height.equalTo(1)
        }
        
        signinButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(passwordLineView.snp.bottom)
            make.trailing.equalTo(passwordLineView.snp.trailing)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }
        
    }
    
    func configViews() {
        let lightGrayColor = UIColor(named: "lightGray")
        newAccountLabel.font = UIFont(name: "Roboto-Bold", size: 30)
        passwordIcon.image = UIImage.init(systemName: "lock")
        emailIcon.image = UIImage.init(systemName: "at")
        emailLineView.backgroundColor = lightGrayColor
        emailIcon.tintColor = lightGrayColor
        passwordIcon.tintColor = lightGrayColor
        passwordLineView.backgroundColor = lightGrayColor
        signinButton.setTitleColor(.link, for: .normal)
        signinButton.bgColor = .clear
        signinButton.indicator = BallPulseIndicator(color: .link)
        
        passwordTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .emailAddress
        
    }
    
    func configureViewsText() {
        let lightGrayColor = UIColor(named: "lightGray")
        newAccountLabel.text = "Nova conta"
        
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: lightGrayColor as Any]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Senha",
            attributes: [NSAttributedString.Key.foregroundColor: lightGrayColor as Any]
        )
        
    }
    
    func configureActions() {
        signinButton.addTarget(self, action: #selector(doCreateAccount(sender:)), for: .touchUpInside)
        
    }
    
    func render() {
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        containerView.clipsToBounds = true
    }
    
    
}
