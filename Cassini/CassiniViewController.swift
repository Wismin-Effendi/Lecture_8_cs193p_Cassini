//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Wismin Effendi on 6/23/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            if let imageVC = (segue.destination.contents as? ImageViewController) {
                imageVC.imageURL = url
                imageVC.title = (sender as? UIButton)?.currentTitle
            }
        }
    }

    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self {
            if let imageVC = secondaryViewController.contents as? ImageViewController,
                imageVC.imageURL == nil {
                // fake it, say we do it but we do nothing
                return true
            }
        }
        // tell splitVC to do it, this will do what it suppose to do. i.e. really put `detailVC` on top of `masterVC`.
        return false
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

