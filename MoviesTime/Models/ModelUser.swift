//
//  ModelUser.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 5.01.22.
//


import Foundation

struct User {
    
    let name: String
    let surname: String
    let password: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension User {
    static func getUserList() -> [User] {
        
        var users: [User] = []
        
        let names = DataUser.shared.names
        let surnames = DataUser.shared.surnames
        let password = DataUser.shared.password
        
        for index in 0..<names.count {
            let user = User(name: names[index],
                            surname: surnames[index],
                            password: password[index])
            
            users.append(user)
        }
        
        return users
    }
}

