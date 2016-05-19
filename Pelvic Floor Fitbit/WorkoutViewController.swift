//
//  WorkoutViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 16/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import CoreBluetooth

class WorkoutViewController: UIViewController {
    
    var centralManager = CBCentralManager()
    var BLEManager = BluetoothManager()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Initialise the BluetoothManager
        BLEManager = BluetoothManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ConnectFitbitPressed() {
        if BLEManager.isBluetoothPoweredOn {
            performSegueWithIdentifier("connectSearchSegue", sender: self)
        }
    }
    
    // Custom Alert Dialog on "Connect Fitbit" button press
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        BLEManager.centralManagerDidUpdateState(centralManager)
        if identifier == "connectSearchSegue" {
            if !BLEManager.isBluetoothPoweredOn {
                showAlertForSettings()
                return false;
            }
        }
        return true;
    }

    // Function to display an custom alert dialog if Bluetooth is turned OFF.
    private func showAlertForSettings() {
        let alertController = UIAlertController(title: "Turn On Bluetooth to Allow \"Intim8\" to Connect to Accessories", message: nil, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Settings", style: .Cancel) { (action) in
            if NSURL(string:"prefs:root=Bluetooth") != nil {
                UIApplication.sharedApplication().openURL(NSURL(string:"prefs:root=Bluetooth")!)
            }
        }
        
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}




