//
//  LoginViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import RealmSwift
import Combine

class LoginViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var password: String = ""
    
    @Published var isValid = true
    @Published var isShowError = false
    @Published var isRegistered = false
    
    private let realmDataStore = RealmDataStore.shared
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
       setUpValidations()
    }
    
    func checkUser() {
        let user = realmDataStore.getUser(with: firstName)
        if user == nil {
            isShowError = true
        } else {
            isRegistered = true
        }
    }
    
    private func setUpValidations() {
        Publishers.CombineLatest($firstName, $password).map { firstName, password in
            return !firstName.isEmpty && !password.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
}

