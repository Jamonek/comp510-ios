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
        
        fbSigninButton.addTarget(self, action: "loginButton:", forControlEvents: UIControlEvents.TouchUpInside)
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
    
    func loginButton(sender:UIButton) {
        let login = FBSDKLoginManager()
        login.logInWithReadPermissions(["email", "public_profile"], fromViewController: self, handler: {(result, error) -> Void in
            if error != nil {
                // Handle error
                NSLog("Login error: %s", error!)
            } else if result.isCancelled {
                // Handle cancellations
                NSLog("Login cancelled")
            } else {
                if result.grantedPermissions.contains("public_profile") {
                    self.returnUserData()
                }
            }
        })
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                let userName : NSString = result.valueForKey("name") as! NSString
                fullName = userName as String
                loggedIn = true
                // dismissView
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
}

