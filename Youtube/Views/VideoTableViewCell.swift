//
//  VideoTableViewCell.swift
//  Youtube
//
//  Created by KARAN D on 05/06/23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImage: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    var video : Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v : Video){
        self.video = v
        
        //Ensure before next checkings
        guard self.video != nil else {
            return
        }
        
        //Set the date and label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbNail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        // Check the cache before downloading again
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // Set the thumbNailImageView
            self.thumbnailImage.image = UIImage(data: cachedData)
            return
        }
        //Download the data
        let url = URL(string : self.video!.thumbnail)
        
        //Get the shared URL Session.shared
        let session = URLSession.shared
        
        //Create a datask
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImage.image = image
                }
            }
            
            
        }
        // Start data task
        dataTask.resume()
        
        
    }
}
