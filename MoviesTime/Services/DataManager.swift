//
//  DataManager.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    let names = [
        "Matrix", "Avatar", "Troy", "Avengers",
        "The Lord Of The Rings: The Fellowship Of The Ring",
        "The Godfather", "The Dark Knight",
        "The Shawshank redemption", "Mad Max: Fury Road",
        "1+1", "Inception", "Taking lives", "The Babadook",
        "Pan's Labyrinth", "Thor: Ragnarok", "Don't Breathe"
    ]
    
    let genre = [
        "Science Fiction", "Fantasy", "History",
        "Fantasy", "Fantasy", "Crime", "Fantasy",
        "Drama", "Post-apocalyptic action", "Comedy",
        "Science fiction action", "Detective", "Horror",
        "Dark fantasy", "Adventures", "Thriller"
    ]
    
    let years = [
        "1999", "2011", "2004", "2012", "2001",
        "1972", "2008", "1994", "2015", "2011",
        "2010", "2004", "2014", "2006", "2017",
        "2016"
    ]
    

    
    
    
    
    
    private init() {}
}
