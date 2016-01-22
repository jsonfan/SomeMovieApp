//
//  MovieAppModel.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class MovieAppModel: NSObject {
    var imdbID: String = ""
    
    func initFromProperties(propertiesDictionary: NSDictionary) {
        imdbID = propertiesDictionary["imdbID"] as! String
    }
}
