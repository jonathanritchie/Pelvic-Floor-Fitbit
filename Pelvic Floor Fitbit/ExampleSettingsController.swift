//
//  SettingsViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 24/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SwiftySettings

class Storage : SettingsStorageType {
    
    subscript(key: String) -> Bool? {
        get {
            return Defaults[key].bool
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> Float? {
        get {
            return Float(Defaults[key].doubleValue)
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> Int? {
        get {
            return Defaults[key].int
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> String? {
        get {
            return Defaults[key].string
        }
        set {
            Defaults[key] = newValue
        }
    }
}

class ExampleSettingsController: SwiftySettingsViewController {
    
    var storage = Storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettingsTopDown()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Method 1
    func loadSettingsTopDown() {
        /* Top Down settings */
        settings = SwiftySettings(storage: storage, title: "Pelvic Floor Fitbit") {
            [Section(title: "Sensor") {
                [OptionsButton(key: "sampling-frequency", title: "Sampling Rate") {
                    [Option(title: "Low", optionId: 1),
                        Option(title: "Medium", optionId: 2),
                        Option(title: "High", optionId: 3)]
                    },
                    OptionsButton(key: "number-of-sensors-used", title: "Pressure Information") {
                        [Option(title: "Basic", optionId: 1),
                            Option(title: "Default", optionId: 2),
                            Option(title: "Detailed", optionId: 3)]
                    },
                    Switch(key: "automatic-shut-down", title: "Automatic Power-Off")]
                },
             Section(title: "Workout Reminders") {
                [OptionsButton(key: "reminder-time", title: "Reminder Time") {
                    [Option(title: "7:00am", optionId: 1),
                        Option(title: "8:00am", optionId: 2),
                        Option(title: "9:00am", optionId: 3),
                        Option(title: "10:00am", optionId: 4),
                        Option(title: "11:00am", optionId: 5),
                        Option(title: "12:00pm", optionId: 6),
                        Option(title: "1:00pm", optionId: 7),
                        Option(title: "2:00pm", optionId: 8),
                        Option(title: "3:00pm", optionId: 9),
                        Option(title: "4:00pm", optionId: 10),
                        Option(title: "5:00pm", optionId: 11),
                        Option(title: "6:00pm", optionId: 12),
                        Option(title: "7:00pm", optionId: 13),
                        Option(title: "8:00pm", optionId: 14),
                        Option(title: "9:00pm", optionId: 15),
                        Option(title: "10:00pm", optionId: 16)]}]
                },
             Section(title: "Personal Profile") {
                [TextField(key: "name", title: "Name", secureTextEntry: false),
                    TextField(key: "age", title: "Age", secureTextEntry: false),
                    TextField(key: "passcode", title: "Passcode (4-digits)", secureTextEntry: true)]
                },
             OptionsSection(key: "keep-history", title: "Keep Historical Data") {
                [Option(title: "1 Month", optionId: 1),
                    Option(title: "6 Months", optionId: 2),
                    Option(title: "1 Year", optionId: 3)]
                },
             OptionsSection(key: "app-colour-theme", title: "Colour Theme") {
                [Option(title: "Blue", optionId: 1),
                    Option(title: "Pink", optionId: 2),
                    Option(title: "Brown", optionId: 3),
                    Option(title: "Yellow", optionId: 4),
                    Option(title: "Black", optionId: 5),
                    Option(title: "Purple", optionId: 6)]
                },
             Section(title: "Privacy & Security") {
             [Switch(key: "use-touch-id", title: "Touch ID"),
                Switch(key: "push-notifications", title: "Push Notifications"),
                OptionsButton(key: "automatic-lock", title: "Automatic Lock") {
                    [Option(title: "30 Seconds", optionId: 1),
                        Option(title: "2 Minutes", optionId: 2),
                        Option(title: "3 Minutes", optionId: 3),
                        Option(title: "5 Minutes", optionId: 4),
                        Option(title: "10 Minutes", optionId: 5),
                        Option(title: "Never", optionId: 6)]
                }]
            }]
        }
    }
}
