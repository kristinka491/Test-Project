//
//  RealmDataStore.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import RealmSwift

class RealmDataStore {
    
    static let shared = RealmDataStore()
    private let realm = try? Realm()
    
    func addUser(firstName: String,
                 lastName: String,
                 email: String) -> Bool {
        if !isUserRegistered(with: email) {
            let user = User()
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            saveObject(user: user)

            return true
        }
        return false
    }
    
//    func getUser(email: String, password: String) -> User? {
//        if let user = getUser(with: login),
//           user.password == password {
//            return user
//        }
//        return nil
//    }
    
    func getUser(with email: String) -> User? {
        let user = realm?.object(ofType: User.self,
                                 forPrimaryKey: email)
        return user
    }

    func isUserRegistered(with email: String) -> Bool {
        return getUser(with: email) != nil
    }
    
    private func saveObject(user: User) {
        try? realm?.write {
            realm?.add(user)
        }
        print("Data Was Saved To Realm Database.")
    }
}

