//
//  AccountService.swift
//  SaoRoque
//
//  Created by Gabriel on 05/09/22.
//

import FirebaseAuth

protocol AccountServiceProtocol {
    func fetchNewAccount(user: UserModel,
                         completion: @escaping FetchNewAccountCompletion)
}
typealias FetchNewAccountCompletion = (Result<String, Error>) -> Void


class AccountService: AccountServiceProtocol {
    
    func fetchNewAccount(user: UserModel,
                         completion: @escaping FetchNewAccountCompletion) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let currentUser = authResult?.user {
                completion(.success(currentUser.uid))
                return
            }
            
            completion(.failure(error ?? NSError(domain: "Ocorreu um erro, tente novamente mais tarde", code: 422)))
        }
    }
}
