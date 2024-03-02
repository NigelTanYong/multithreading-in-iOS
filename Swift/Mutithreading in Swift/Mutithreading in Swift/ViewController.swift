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
        // Perform task in a background thread to avoid blocking the main UI thread
        DispatchQueue.global(qos: .background).async{
            // Construct URL for a random image
            let url = URL(string: "https://loremflickr.com/2000/2000")
            // Fetch image data from the URL
            let data = try! Data(contentsOf: url!)
            // Convert fetched data into UIImage
            let image = UIImage(data: data)
            
            // Update UI on the main thread
            DispatchQueue.main.async{
                self.imageView.image=image
            }
        }
    }
    
}

