//
//  SigninView.swift
//  SaoRoque
//
//  Created by Gabriel on 29/08/22.
//

import UIKit

class SigninView: UIView {

    var newAccountLabel: UILabel
    var teste: UILabel
    var containerView: UIView
    
    override init(frame: CGRect) {
        newAccountLabel = UILabel()
        teste = UILabel()
        containerView = UIView()
        super.init(frame: frame)
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
            newAccountLabel, newAccountLabel
        )
    }
    
    func configConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(500)
        }
        
        newAccountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(20)
            
        }
        
        teste.snp.makeConstraints { make in
            make.top.equalTo(newAccountLabel.snp.bottom)
            make.leading.equalTo(20)
            make.bottom.equalToSuperview()
        }
    }
    
    func configViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureViewsText() {
        newAccountLabel.text = "Nova conta"
        teste.text = "teste"
        
    }
    
    func configureActions() {
        
    }
    
    func render() {
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
    }
    
    
}
