//
//  Movie.swift
//  
//
//  Created by Josh Olumese on 7/3/17.
//
//

import Foundation


class  Movie {
    let baseUrlString = "https://image.tmdb.org/t/p/w500"
    var title: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overiew"
        let posterPath = dictionary["poster_path"] as? String
        let fullPosterPath = baseUrlString + posterPath
        posterUrl = URL(string: fullPosterPath)
        
        
        // Set the rest of the properties
    }
}
