//
//  MovieAppDataBrokerBase.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import Foundation
import Alamofire

protocol DataBrokerRequestor {
    func brokerRequestorComplete(resultArray: Array<AnyObject>)
    func brokerRequestorFailed(error: NSError)
}


class MovieAppDataBrokerBase: NSObject {
    let requestor: DataBrokerRequestor
    
    init(forRequestor: DataBrokerRequestor){
        requestor = forRequestor
    }
    
    func fetchDataAt(aURI: String) {
        var resultArray: Array<AnyObject> = []
        
        Alamofire.request(.GET, aURI).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            var tempResult: Array<AnyObject> = []
            
            if response.result.value is Dictionary<String, AnyObject> {
                tempResult = [response.result.value as! Dictionary<String, AnyObject>]
            }
            else if response.result.value is Array<AnyObject> {
                tempResult = response.result.value as! Array<AnyObject>
            }
            
            // We now know we have an array of JSON objects
            for dataDict: AnyObject in tempResult {
                resultArray.append(self.createModelFrom(dataDict as! Dictionary<String, AnyObject>)!)
            }
            
            self.requestor.brokerRequestorComplete(resultArray)
        }
    }
    
    func createModelFrom(dataDictionary: NSDictionary) -> MovieAppModel? {
        return nil
    }
    
}
