//
//  MovieDataBroker.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class MovieDataBroker: MovieAppDataBrokerBase {
    
    override var description: String {
        return "I am a Movie Data Broker"
    }
    
    override func createModelFrom(dataDictionary: NSDictionary) -> MovieAppModel? {
        let modelObj = Movie()
        
        modelObj.initFromProperties(dataDictionary)
        
        return modelObj
    }
    
    func getMovieWithTitle(aTitle: String) {
        fetchDataAt(MovieSettingsAdapter.GetOMDBMovieTitleEndPoint().stringByAppendingString(aTitle))
    }
    
    func getMovieWithIMDBID(aID: String) {
        fetchDataAt(MovieSettingsAdapter.GetOMDBMovieIMDBIDEndPoint().stringByAppendingString(aID))
    }
    
}