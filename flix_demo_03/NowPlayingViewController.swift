//
//  NowPlayingViewController.swift
//  flix_demo_03
//
//  Created by Josh Olumese on 6/21/17.
//  Copyright © 2017 Josh Olumese. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 50
        
        tableView.dataSource = self
        fetchMovies()
        
        activityIndicator.startAnimating()
        
        
    }
    
    func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    
    func fetchMovies() {
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        
                self.refreshControl.endRefreshing()
                self.activityIndicator.stopAnimating()
            }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        let movie = movies[indexPath.row]
//        let title = movie["title"] as! String
//        let overview = movie["overview"] as! String
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        
//        let posterPathString = movie["poster_path"] as! String
//        let baseURLString = "https://image.tmdb.org/t/p/w500"
//         let posterURL = URL(string: baseURLString + posterPathString)!
        
        if movie.posterUrl != nil{
            cell.posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
        
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movies = [movie]
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
