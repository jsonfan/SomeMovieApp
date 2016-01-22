//
//  MovieSettingsAdapter.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation

class MovieSettingsAdapter {
    
    class func SettingsData() -> NSDictionary {
        let path = NSBundle.mainBundle().pathForResource("Movie-Settings", ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
    
    class func GetURIData() -> NSDictionary {
        return SettingsData().objectForKey("URIs") as! NSDictionary
    }
    
    class func GetOMDBAPIBase() -> String {
        return GetURIData().objectForKey("OMDBAPIBase") as! String
    }
    
    class func GetURIByIDOrTitle() -> NSDictionary {
        return GetURIData().objectForKey("OMDBByIDOrTitle") as! NSDictionary
    }
    
    class func GetOMDBMovieTitleEndPoint() -> String {
        return GetOMDBAPIBase().stringByAppendingString(GetURIByIDOrTitle().objectForKey("MovieTitle") as! String)
    }
    class func GetOMDBMovieIMDBIDEndPoint() -> String {
        return GetOMDBAPIBase().stringByAppendingString(GetURIByIDOrTitle().objectForKey("IMDbID") as! String)
    }
    
    class func GetURIBySearch() -> NSDictionary {
        return GetURIData().objectForKey("OMDBBySearch") as! NSDictionary
    }
    
    class func GetOMDBSearchEndPoint() -> String {
        return GetOMDBAPIBase().stringByAppendingString(GetURIBySearch().objectForKey("SearchParameter") as! String)
    }
    
    class func AppendAParameter() -> String {
        return "&"
    }
    
    class func GetYearOfRelease() -> String {
        return GetURIData().objectForKey("YearOfRelease") as! String
    }
    
}