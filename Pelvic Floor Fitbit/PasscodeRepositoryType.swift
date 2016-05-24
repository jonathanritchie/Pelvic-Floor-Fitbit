//
//  PasscodeRepositoryType.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 20/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit

class PasscodeRepository: PasscodeRepositoryType {
    
    var hasPasscode: Bool = true
    var passcode: [String]?
    
    func savePasscode(passcode: [String]) {}
    
    func deletePasscode() {}
    
}