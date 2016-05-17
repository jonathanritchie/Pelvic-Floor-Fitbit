//
//  WorkoutViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 16/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import CoreBluetooth

class WorkoutViewController: UIViewController, CBCentralManagerDelegate {
    
    var isBluetoothPoweredOn = false
    var centralManager = CBCentralManager()
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
        switch (central.state) {
        case .PoweredOn:
            isBluetoothPoweredOn = true
        case .PoweredOff:
            isBluetoothPoweredOn = false
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Custom Alert Dialog on "Connect Fitbit" button press
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "connectSearchSegue" {
            if !isBluetoothPoweredOn {
                showAlertForSettings()
                return false;
            }
        }
        return true;
    }

    private func showAlertForSettings() {
        let alertController = UIAlertController(title: "Pelvic Floor Fitbit", message: "Turn on Bluetooth to connect to Fitbit", preferredStyle: .Alert)
        
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




