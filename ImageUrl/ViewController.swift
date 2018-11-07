//
//  ViewController.swift
//  ImageUrl
//
//  Created by Trần Đức Anh on 11/6/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    let catPictureURl = URL(string: "http://i.imgur.com/w5rkSIj.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: catPictureURl) { (data, respone, error) in
            if let e = error {
                print("Error Occurred: \(e)")
            } else {
                if (respone as? HTTPURLResponse) != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        self.myImageView.image = image
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No respone from server")
                }
            }
        }
        downloadPicTask.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

