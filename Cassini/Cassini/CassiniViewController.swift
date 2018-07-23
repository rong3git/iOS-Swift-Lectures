//
//  CassiniViewController.swift
//  Cassini
//
//  Created by rongc on 7/22/18.
//  Copyright © 2018 Rongchang Lei. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                if let imageVC = segue.destination.contents as? ViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}

extension UIViewController {
    var contents: UIViewController {
        if let navcontroller = self as? UINavigationController {
            return navcontroller.visibleViewController ?? self
        } else {
            return self
        }
    }
}
