//
//  ViewController.swift
//  Mutithreading in Swift
//
//  Created by Nigel Tan Yong on 2/3/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func randomImage(_ sender: Any) {
        // Construct URL for a random image
        let url = URL(string: "https://loremflickr.com/2000/2000")!
        // Create a download task with the shared URLSession
        let task = URLSession.shared.downloadTask(with:url){(localUrl, response, error) in
            // Read data from the downloaded file
            let data = try! Data(contentsOf: localUrl!)
            // Convert fetched data into UIImage
            let image = UIImage(data: data)
            
            // Update UI on the main thread
            DispatchQueue.main.async {
                self.imageView.image=image
            }
        }
        // Start the download task
        task.resume()
       
    }
    
}

