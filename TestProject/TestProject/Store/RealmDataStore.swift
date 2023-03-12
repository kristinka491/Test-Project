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
        if !isUserRegistered(with: firstName) {
            let user = User()
            user.firstName = firstName
            user.lastName = lastName
            user.email = email
            saveObject(user: user)

            return true
        }
        return false
    }
    
    func getUser(with firstName: String) -> User? {
        let user = realm?.object(ofType: User.self,
                                 forPrimaryKey: firstName)
        return user
    }

    func isUserRegistered(with firstName: String) -> Bool {
        return getUser(with: firstName) != nil
    }
    
    private func saveObject(user: User) {
        try? realm?.write {
            realm?.add(user)
        }
        debugPrint("Data Was Saved To Realm Database.")
    }
}

