//
//  DataUser.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 5.01.22.
//

class DataUser {

    static let shared = DataUser()
    
    let names = ["Alex", "Viktor", "Eugenya"]
    
    let surnames = ["Rauko", "", "Bruyko"]
    
    let password = ["123", "123", "123"]
    
    private init() {}
}
