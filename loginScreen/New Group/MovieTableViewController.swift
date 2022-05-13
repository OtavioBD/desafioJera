//
//  MovieTableViewController.swift
//  loginScreen
//
//  Created by Otavio Benatti Dias on 10/05/22.
//

import UIKit

class MovieTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
}

}
// usa para saber que Row eu selecionei
extension MovieTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("sua mae") //começar daki amanha!!!
    }
}


extension MovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! MovieCellTableViewCell
        
        movieCell.movie = arrayMovies[indexPath.row]
        
        
        return movieCell
    }
}
