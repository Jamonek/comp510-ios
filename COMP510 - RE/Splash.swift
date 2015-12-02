//
//  COMP510 - RE
//
//  Created by Jamone Alexander Kelly on 9/24/15.
//  Copyright © 2015 COMP510. All rights reserved.
//

import UIKit
import ChameleonFramework
import FBSDKCoreKit
import FBSDKLoginKit

class Splash: UIViewController {
    @IBOutlet var fbSigninButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let colors = [UIColor.flatSkyBlueColor(), UIColor.flatSkyBlueColorDark()]
        view.backgroundColor = UIColor(gradientStyle: .Radial, withFrame: view.frame, andColors: colors)
        
        let loginMutable : NSMutableAttributedString = NSMutableAttributedString(string: fbSigninButton.currentTitle!, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18), NSForegroundColorAttributeName: UIColor.whiteColor()])
        fbSigninButton.setAttributedTitle(loginMutable, forState: UIControlState.Normal)
        
        fbSigninButton.backgroundColor = UIColor.clearColor()
        fbSigninButton.layer.borderColor = UIColor.whiteColor().CGColor
        fbSigninButton.layer.borderWidth = 1.75
        fbSigninButton.layer.cornerRadius = 6
        
        fbSigninButton.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let height:CGFloat = view.frame.height
        let width:CGFloat = view.frame.width
        
        fbSigninButton.frame = CGRect(
            x: height*0.5,
            y: width*0.5,
            width: 250,
            height: 50
        )
    }


}

