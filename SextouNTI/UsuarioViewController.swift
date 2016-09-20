//
//  UsuarioViewController.swift
//  SextouNTI
//
//  Created by Rabelo on 17/05/16.
//  Copyright © 2016 br.com.fagutapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FirebaseAuth

class UsuarioViewController: UIViewController {
    
    @IBOutlet weak var uilName: UILabel!
    @IBOutlet weak var uiimvProfilePic: UIImageView!
    @IBOutlet weak var uilEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uiimvProfilePic.layer.cornerRadius = self.uiimvProfilePic.frame.size.height/2
        self.uiimvProfilePic.layer.masksToBounds = false
        self.uiimvProfilePic.clipsToBounds = true
        
        self.uiimvProfilePic.layer.borderWidth = 3.0;
        self.uiimvProfilePic.layer.borderColor = UIColor.redColor().CGColor
        
        if let user = FIRAuth.auth()?.currentUser {
            let name = user.displayName
            let email = user.email
            let photoUrl = user.photoURL
            let uid = user.uid;
            
            self.uilName.text = name
            self.uilEmail.text = email
            let data = NSData(contentsOfURL: photoUrl!)

            self.uiimvProfilePic.image = UIImage(data: data!)!
            
        } else {
            // No user is signed in.
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func logoutUser(sender: AnyObject) {
        
        // signs the user out of the firebase  app
        try! FIRAuth.auth()!.signOut()
        
        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        // move the user to the Login Screen
        let mainStoreBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let LoginViewController  = mainStoreBoard.instantiateViewControllerWithIdentifier("LoginViewController")
        
        self.presentViewController(LoginViewController, animated: true, completion: nil)
        
    }

}
