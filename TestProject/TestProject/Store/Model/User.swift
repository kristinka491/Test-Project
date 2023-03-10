//
//  User.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var email = ""
    @Persisted var firstName = ""
    @Persisted var lastName = ""
} 
