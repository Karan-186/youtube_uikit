//
//  ViewController.swift
//  Youtube
//
//  Created by KARAN D on 04/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

