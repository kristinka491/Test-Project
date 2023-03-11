//
//  SignInViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import RealmSwift
import Combine

class SignInViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    
    @Published var isShowError = false
    @Published var isRegistered = false
    @Published var isEmailValid = false
    @Published var isSaveButtonDisabled = true
    
    private let realmDataStore = RealmDataStore.shared
    private var publishers = Set<AnyCancellable>()
    
    init() {
        setUpValidations()
    }

    func registerUser() {
        let isUserRegistered = realmDataStore.addUser(firstName: firstName, lastName: lastName, email: email)
        if !isUserRegistered {
            isShowError = true
        } else {
            isRegistered = true
        }
    }
    
    private func setUpValidations() {
        $email
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return email.isEmpty ? true : emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &publishers)
        
        Publishers.CombineLatest($email, $isEmailValid).map { mail, isValid in
            return mail.isEmpty || !isValid
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isSaveButtonDisabled, on: self)
        .store(in: &publishers)
    }
}
