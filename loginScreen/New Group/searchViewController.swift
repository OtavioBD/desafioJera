//
//  searchViewController.swift
//  loginScreen
//
//  Created by Otavio Benatti Dias on 09/05/22.
//

import UIKit

struct Movie: Codable {
    var title: String
    var overview: String
    var vote_average: Double
    var id: Int
}

struct APIResponse: Codable {
    var page: Int
    var results: [Movie]
}

class searchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchTextField(_ sender: Any) {

        print(searchTextField.text)
        
        if searchTextField.text == "" {}
        else {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=f77106f23b6b08c32693f89c7a564a2c&query=\(searchTextField.text!)")!
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                print(String(data: data!, encoding: .utf8))
                
                let decoder = JSONDecoder()

                do {
                    let decoded = try decoder.decode(APIResponse.self, from: data!)
                    print(decoded.results)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    DispatchQueue.main.async {
                        
                        let movieTableViewController = storyboard.instantiateViewController(identifier: "MovieTableViewController") as! MovieTableViewController
                        movieTableViewController.arrayMovies = decoded.results
                        self.navigationController?.pushViewController(movieTableViewController, animated: true)
                        
                    }
                    
                } catch {
                    print("Failed to decode JSON")
                }
            }
            
            task.resume()
        }
        
    }
    
}
