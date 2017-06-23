//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Wismin Effendi on 6/23/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {


    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            if let imageVC = (segue.destination.contents as? ImageViewController) {
                imageVC.imageURL = url
                imageVC.title = (sender as? UIButton)?.currentTitle
            }
        }
    }

}

extension UIViewController {
    
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else if let tabBarCon = self as? UITabBarController {
            return tabBarCon.selectedViewController ?? self
        } else {
            return self
        }
    }
}
