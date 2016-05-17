//
//  BluetoothManager.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 17/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothManager: CBCentralManager {
    
    var isBluetoothPoweredOn = false
    
    // centralManagerDidUpdateState will change the value of isBluetoothPoweredOn when Bluetooth is turned ON/OFF.
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
    
}
