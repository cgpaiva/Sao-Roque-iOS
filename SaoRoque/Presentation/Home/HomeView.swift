//
//  HomeView.swift
//  SaoRoque
//
//  Created by Gabriel on 05/09/22.
//

import UIKit

class HomeView: UIView {
    
    var logoImageView: UIImageView
    var containerView: UIScrollView
    var menuContainerView: UIView
    
    
    override init(frame: CGRect) {
        containerView = UIScrollView()
        logoImageView = UIImageView()
        menuContainerView = UIView()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeView: ViewCodable {
    
    func configHierarchy() {
//        containerView.addSubviews(logoImageView, menuContainerView)
//        addSubview(containerView)
        
        addSubviews(logoImageView, menuContainerView)
        
    }
    
    func configConstraints() {
        
//        containerView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.leading.equalToSuperview()
//        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        
        menuContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
            
    }
    
    func configViews() {
        backgroundColor = .systemBlue
        logoImageView.image = Asset.logoWhite.image
        logoImageView.contentMode = .scaleToFill
        menuContainerView.backgroundColor = .white
        menuContainerView.layer.cornerRadius = 30
        menuContainerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    func configureViewsText() {
        
    }
    
    func configureActions() {
        
    }
    
    func render() {
        
    }
    
    
}

