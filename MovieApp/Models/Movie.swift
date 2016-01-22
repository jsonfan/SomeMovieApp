//
//  Movie.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class Movie : MovieAppModel {
    
    var title: String = ""
    var year: String = ""
    var released: String = ""
    var runtime: String = ""
    var plot: String = ""
    var language: String = ""
    var imdbRating: String = ""
    var poster: String = ""
    
    override func initFromProperties(propertiesDictionary: NSDictionary) {
        title = propertiesDictionary["Title"] as! String
        year = propertiesDictionary["Year"] as! String
        released = propertiesDictionary["Released"] as! String
        runtime = propertiesDictionary["Runtime"] as! String
        plot = propertiesDictionary["Plot"] as! String
        language = propertiesDictionary["Language"] as! String
        imdbRating = propertiesDictionary["imdbRating"] as! String
        poster = (propertiesDictionary["Poster"] as! String).stringByReplacingOccurrencesOfString("http", withString: "https")
    }
    
    
}