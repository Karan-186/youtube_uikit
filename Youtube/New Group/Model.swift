//
//  Model.swift
//  Youtube
//
//  Created by KARAN D on 05/06/23.
//

import Foundation

class Model {
    
    func getVideos(){
        //Create URL
        let url = URL(string: constants.API_URL)
        guard url != nil else {
            return
        }
        
        //Create URL Session Object
        let session = URLSession.shared
        
        //Create a data task from URL Session Object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            //Check and error
            if error != nil || data != nil {
                return
            }
            
            //Parsing the data into video objects
        }
        //Kick of the task
        dataTask.resume()
    }
}
