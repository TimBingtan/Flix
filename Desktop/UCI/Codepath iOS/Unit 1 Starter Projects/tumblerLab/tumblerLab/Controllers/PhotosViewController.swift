//
//  ViewController.swift
//  tumblerLab
//
//  Created by Memo on 1/10/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

// –––––    Comment    –––––

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController {
    

    // Connect UIImageLabel

    
    @IBOutlet weak var tableView: UITableView!
    
    // 1.       2.             3.
    var posts: [[String: Any]] = []     // Array of dictionaries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getPosts()
    }
    
    func getPosts() {
        API.getPosts() { (posts) in
            if let posts = posts {
                self.posts = posts
                print(self.posts)
                self.tableView.reloadData()
            }
        }
    }
    
}


extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // –––––  TODO: Configure number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Code here
        return posts.count
        
    }
    
    
    // –––––  TODO: Configure CellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Code here
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]]{
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            
            // 1. Get the first photo in the photos array
            let photo = photos[0]
            // 2. Get the original size dictionary from the photo
            let originalSize = photo["original_size"] as! [String: Any]
            // 3. Get the URL string from the original size dictionary
            let urlString = originalSize["url"] as! String
            // 4. Create the URL using the URL string
            let url = URL(string: urlString)
            
            cell.pictureView.af_setImage(withURL: url!)
            
            
        }
        
        
        
        
        
        
        
        
        
        return cell
        
    }

 
}

