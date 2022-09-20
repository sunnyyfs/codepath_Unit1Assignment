//
//  ViewController.swift
//  Unit1Assignment
//
//  Created by Sunny Yu on 9/6/22.
//

import UIKit
import AlamofireImage
//Tableview recipe
// 1. add UITableViewDataSource, UITableViewDelegate, this means you want the view controller to work with the tableview (tableview outlets)
class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    var movies = [[String:Any]]() //array of dict
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step 3: calls the two functions from step 2
        // however nothing will get printed because the viewdidload is before we load the data so we would have to call again -> step 4
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    // data from the url is stored in dataDictionary
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    //casting
                    self.movies = dataDictionary["results"] as! [[String:Any]]
                 
                    // reload data after getting data from api, calls the functions from step 2 again (step 4 maybe?)
                    self.tableView.reloadData()
                 
                    print(dataDictionary)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    // step 2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeue -> access to outlets
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        // download the image file 
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    // prepare the mext screen
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        // fimd the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies[indexPath!.row]
        // pass the slected movie to the details view controller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        // clean up after selection, highlights the selection, goes to the detail page, when back to the main page the selection is no longer highlighted
        tableView.deselectRow(at: indexPath!, animated: true)
    }
    

}

