//
//  ActivitiesViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 25/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func activityButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("showConnectionView", sender: self)
    }
}
