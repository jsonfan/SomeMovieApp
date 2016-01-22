//
//  MovieAppViewController.swift
//  MovieApp
//
//  Created by Jason on 1/20/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit
import Alamofire

class MovieAppViewController: UIViewController, DataBrokerRequestor, UITableViewDataSource, UITableViewDelegate {
    var movieArray: [AnyObject] = []
    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let broker = MovieDataBroker(forRequestor: self)
        // titles with spaces do not work for some reason
        broker.getMovieWithTitle("Frozen")
        broker.getMovieWithIMDBID("tt0944947")
        broker.getMovieWithTitle("Naruto")
        broker.getMovieWithIMDBID("tt2488496")
        broker.getMovieWithIMDBID("tt2015381")
        broker.getMovieWithTitle("Friends")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UITableViewDelegate/DataSource implementation
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MovieTableCell = tableView.dequeueReusableCellWithIdentifier("movieTableCellID")! as! MovieTableCell
        
        cell.model = movieArray[indexPath.row] as? Movie
        return cell
    }
    // MARK: - DataBrokerRequestor implementation
    
    
    func brokerRequestorComplete(resultArray: Array<AnyObject>) {
        movieArray.appendContentsOf(resultArray)
        
        self.movieTableView.reloadData()
    }
    
    func brokerRequestorFailed(error: NSError) {
        print(error)
    }

}

