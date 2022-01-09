//
//  DataUser.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 5.01.22.
//

class DataUser {

    static let shared = DataUser()
    
    let names = ["Alex", "Victor", "Eugenya"]    
    let surnames = ["Rauko", "Savko", "Bruyko"]
    let password = ["1", "2", "3"]
    
    private init() {}
}
