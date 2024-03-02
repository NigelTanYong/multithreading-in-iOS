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
        DispatchQueue.global(qos: .background).async{
            let url = URL(string: "https://loremflickr.com/2000/2000")
            let data = try! Data(contentsOf: url!)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async{
                self.imageView.image=image
            }
        }
    }
    
}

