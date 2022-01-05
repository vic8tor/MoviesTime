//
//  Model.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

struct Movie {
    let name: String
    let genre: String
    let year: String
    var raiting: Float {
        Float.random(in: 1...10)
    }
    var image: String {
        "\(name) + \(year)"
    }
    
    
    
}
