//
//  TabBarPage.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//
import Foundation

struct TabBarPage: Identifiable, Hashable {
    var id = UUID()
    var page: Any
    var icon: String
    var tag: String
    
    func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        }
    
    static func == (lhs: TabBarPage, rhs: TabBarPage) -> Bool {
        return lhs.id == rhs.id
    }
}
