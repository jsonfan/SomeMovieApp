//
//  MovieAppViewController.swift
//  MovieApp
//
//  Created by Jason on 1/20/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit
import Alamofire

class MovieAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, MovieSettingsAdapter.GetOMDBMovieTitleEndPoint().stringByAppendingString("Frozen")).responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
//        print(MovieSettingsAdapter.GetOMDBMovieTitleEndPoint())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

