//
//  PasscodeLockConfiguration.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 20/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import PasscodeLock

class PasscodeLockConfiguration: PasscodeLockConfigurationType {
    let repository: PasscodeRepositoryType
    var passcodeLength = 4 // Specify the required amount of passcode digits
    var isTouchIDAllowed = true // Enable Touch ID
    var shouldRequestTouchIDImmediately = true // Use Touch ID authentication immediately
    var maximumInccorectPasscodeAttempts = 3 // Maximum incorrect passcode attempts
    
    init(repository: PasscodeRepositoryType) {
        self.repository = repository
    }
    
    init() {
        self.repository = PasscodeRepository() // The repository that was created earlier
    }
}
