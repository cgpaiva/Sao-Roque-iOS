//
//  SigninView.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import UIKit

class SigninView: UIView {

    var newAccountLabel: UILabel
    var containerView: UIView
    var emailTextField: UITextField
    var emailIcon: UIImageView
    var passwordTextField: UITextField
    var emailLineView: UIView
    var passwordLineView: UIView
    var passwordIcon: UIImageView
    var signinButton: UIButton
    
    override init(frame: CGRect) {
        newAccountLabel = UILabel()
        containerView = UIView()
        emailTextField = UITextField()
        passwordTextField = UITextField()
        emailIcon = UIImageView()
        emailLineView = UIView()
        passwordLineView = UIView()
        passwordIcon = UIImageView()
        signinButton = UIButton()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
    }
    
    func configureViewsText() {
        let lightGrayColor = UIColor(named: "lightGray")
        newAccountLabel.text = "Nova conta"
        signinButton.setTitle("Confirmar", for: .normal)
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
        
    }
    
    func render() {
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        containerView.clipsToBounds = true
    }
    
    
}
