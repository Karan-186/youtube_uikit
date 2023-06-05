//
//  ViewController.swift
//  Youtube
//
//  Created by KARAN D on 04/06/23.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , ModelDelegate{
        
    
    @IBOutlet var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the dataSource and the delegate
        tableView.dataSource = self
        tableView.dataSource = self
        
        model.delgate = self
        
        model.getVideos()
    }
    
    // MARK: - Model delgate methods
    func videosFetched(_ videos: [Video]) {
        
        //Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the Table View
        tableView.reloadData()
        
    }
    
    
    // MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID,for: indexPath)
        
        //Configure the cell with data
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        //Return the Cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

}

