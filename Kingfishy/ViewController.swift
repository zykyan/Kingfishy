//
//  ViewController.swift
//  Kingfishy
//
//  Created by Naren Maharjan on 3/21/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LOADED")
        let urlOne = URL(string: "https://brownthomas-image.s3.eu-west-1.amazonaws.com/1616074873983alpas-partner-logo.jpg")
        let url = URL(string: "https://i.ibb.co/HDdBjFM/Twalla-Image.png")
//        setImage(url: urlOne!)
        setImage(url: url!)
        // Do any additional setup after loading the view.
    }

    func setImage(url: URL) {
        
            let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
            imageView.kf.setImage(
                with: url,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage,
                    .progressiveJPEG(.default),
                ]){ result in
                switch result {
                case .success(let value):
                    print("Image: \(value.image). Got from: \(value.cacheType)")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
            
        }
    
}

