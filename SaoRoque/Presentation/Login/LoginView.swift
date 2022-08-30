//
//  LoginView.swift
//  SaoRoque
//
//  Created by Gabriel on 28/08/22.
//

import UIKit
import SnapKit

protocol LoginViewDelegate {
    func signin()
}

class LoginView: UIView {
    
    var viewModel: LoginViewModelProtocol? {
        didSet {
            setupView()
        }
    }
    
    var delegate: LoginViewDelegate?
    
    var containerScrollView: UIScrollView
    var logoImageView: UIImageView
    var titleLabel: UILabel
    var emailIcon: UIImageView
    var emailTextField: UITextField
    var emailLineView: UIView
    var passwordIcon: UIImageView
    var passwordTextField: UITextField
    var passwordLineView: UIView
    var forgotPasswordButton: UIButton
    var loginButton: UIButton
    var signinInfoLabel: UILabel
    var signinInfoLeadingView: UIView
    var signinInfoTrailingView: UIView
    var signinButton: UIButton
    
    
    override init(frame: CGRect) {
        containerScrollView = UIScrollView()
        logoImageView = UIImageView()
        titleLabel = UILabel()
        emailIcon = UIImageView()
        emailTextField = UITextField()
        emailLineView = UIView()
        passwordIcon = UIImageView()
        passwordTextField = UITextField()
        passwordLineView = UIView()
        forgotPasswordButton = UIButton()
        loginButton = UIButton()
        signinInfoLabel = UILabel()
        signinInfoLeadingView = UIView()
        signinInfoTrailingView = UIView()
        signinButton = UIButton()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func doSignin(sender: UIButton) {
        delegate?.signin()
    }
    
}

extension LoginView: ViewCodable {
    
    func configHierarchy() {
        addSubview(containerScrollView)
        containerScrollView.addSubviews(
            logoImageView, titleLabel,
            emailIcon, emailTextField,
            emailLineView, passwordIcon,
            passwordTextField, passwordLineView,
            forgotPasswordButton, loginButton,
            signinInfoLabel, signinInfoLeadingView,
            signinInfoTrailingView, signinButton
        )
    }
    
    func configConstraints() {
        containerScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.leading.equalTo(40)
        }
        
        emailIcon.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalTo(40)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(emailIcon.snp.trailing).offset(15)
            make.centerY.equalTo(emailIcon.snp.centerY)
            make.height.equalTo(30)
        }
        
        emailLineView.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(2)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(emailTextField.snp.leading)
            make.height.equalTo(1)
        }
        
        passwordIcon.snp.makeConstraints { make in
            make.top.equalTo(emailLineView.snp.bottom).offset(40)
            make.leading.equalTo(40)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(passwordIcon.snp.trailing).offset(15)
            make.centerY.equalTo(passwordIcon.snp.centerY)
            make.height.equalTo(30)
        }
        
        passwordLineView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(2)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.height.equalTo(1)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordLineView.snp.bottom).offset(5)
            make.trailing.equalTo(passwordLineView.snp.trailing)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(60)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(self.snp.leading).offset(40)
            make.height.equalTo(50)
            
        }
        
        signinInfoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(loginButton.snp.centerX)
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        signinInfoLeadingView.snp.makeConstraints { make in
            make.centerY.equalTo(signinInfoLabel.snp.centerY)
            make.leading.equalTo(loginButton.snp.leading).offset(10)
            make.trailing.equalTo(signinInfoLabel.snp.leading).offset(-20)
            make.height.equalTo(1)
        }
        
        signinInfoTrailingView.snp.makeConstraints { make in
            make.centerY.equalTo(signinInfoLabel.snp.centerY)
            make.leading.equalTo(signinInfoLabel.snp.trailing).offset(20)
            make.trailing.equalTo(loginButton.snp.trailing).offset(-10)
            make.height.equalTo(1)
        }
        
        signinButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.leading.equalTo(self.snp.leading).offset(40)
            make.top.equalTo(signinInfoLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(containerScrollView.snp.bottom).offset(-30)
        }
    }
    
    func render() {
        let lightGrayColor = UIColor(named: "lightGray")
        emailIcon.tintColor = lightGrayColor
        emailLineView.backgroundColor = lightGrayColor
        passwordLineView.backgroundColor = lightGrayColor
        passwordIcon.tintColor = lightGrayColor
        backgroundColor = .white
        signinInfoLeadingView.backgroundColor = lightGrayColor
        signinInfoLabel.textColor = lightGrayColor
        signinInfoTrailingView.backgroundColor = lightGrayColor
    }
    
    func configViews() {
        logoImageView.image = Asset.logo.image
        logoImageView.contentMode = .scaleToFill
        emailIcon.image = UIImage.init(systemName: "at")
        passwordIcon.image = UIImage.init(systemName: "lock")
        titleLabel.font = UIFont(name: "Roboto-Bold", size: 31)
        forgotPasswordButton.setTitleColor(UIColor.link, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        loginButton.configuration = UIButton.Configuration.filled()
        loginButton.configuration?.cornerStyle = .large
        signinButton.configuration = UIButton.Configuration.gray()
        signinButton.configuration?.cornerStyle = .large
        
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        
        emailTextField.attributedPlaceholder = viewModel?.emailTextFieldAttributedString
        passwordTextField.attributedPlaceholder = viewModel?.passwordTextFieldAttributedString
        
        UITextField
            .configReturnKeyType(
                fields: [
                    emailTextField,
                    passwordTextField
                ]
            )
        
    }
    
    func configureViewsText() {
        forgotPasswordButton.setTitle("Esqueceu sua senha?", for: .normal)
        loginButton.setTitle("Entrar", for: .normal)
        signinInfoLabel.text = "Ou"
        signinButton.setTitle("Criar nova conta", for: .normal)
    }
    
    func configureActions() {
        signinButton.addTarget(self, action: #selector(doSignin(sender:)), for: .touchUpInside)
    }
    
    
}
