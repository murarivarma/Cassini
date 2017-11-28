//
//  ImageViewController.swift
//  Cassini
//
//  Created by Murari Varma on 26/11/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil { // if we are on screen
                fetchImage()        //fetch image
            }
        }
    }
    
    // MARK: private implementation
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private func fetchImage() {
        if let url = imageURL {
            
            // this code blocks the UI until the image is loaded.
            // this code should run in a different thread.
            activityIndicator.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self?.imageURL {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    //Mark: ViewController lifecycle
    
//    override func viewDidLoad() { //for demo of displaying image
//        super.viewDidLoad()
//        imageURL = DemoURL.microsoft_cms
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            scrollView.zoomScale = 1.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    
    var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            activityIndicator?.stopAnimating()
            //imageView.isUserInteractionEnabled = true
        }
    }
    
}

extension ImageViewController:  UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("i got called")
        return imageView
    }
}

