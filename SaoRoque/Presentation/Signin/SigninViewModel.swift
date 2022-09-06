//
//  SigninViewModel.swift
//  SaoRoque
//
//  Created by Gabriel on 05/09/22.
//

import Foundation

protocol SiginViewModelProtocol {
    func validateFields(email: String, password: String,
                        completion: @escaping ValidateFieldsResult)
}

typealias ValidateFieldsResult = (Result<UserModel, NSError>) -> Void

class SigninViewModel: SiginViewModelProtocol {
    
    func validateFields(email: String, password: String,
                        completion: @escaping ValidateFieldsResult) {
        
        let userModel = UserModel(email: email, password: password)

        
        if email.isEmpty {
            completion(.failure(NSError(domain: "Preencha o campo de e-mail", code: 400)))
            return
        }
        
        if password.isEmpty {
            completion(.failure(NSError(domain: "Preencha o campo de senha", code: 400)))
            return
        }
        
        completion(.success(userModel))
        
    
        
    }
    
}
