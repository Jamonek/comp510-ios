//
//  Tab.swift
//  COMP510 - RE
//
//  Created by Jamone Alexander Kelly on 12/2/15.
//  Copyright © 2015 COMP510. All rights reserved.
//

import UIKit

class Tab: UITabBarController {
 
    override func viewDidAppear(animated: Bool) {
        if !loggedIn {
            self.performSegueWithIdentifier("splashVCSegue", sender: self)
        }
    }
}
