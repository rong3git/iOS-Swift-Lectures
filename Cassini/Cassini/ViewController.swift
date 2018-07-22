//
//  ViewController.swift
//  Cassini
//
//  Created by rongc on 7/22/18.
//  Copyright © 2018 Rongchang Lei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
//                imageView.sizeToFit()
//                scrollView.contentSize = imageView.frame.size
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
        
    }
    //MARK: - UIScrollView Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //pinch to return the whole image
        return imageView
    }
    
}

