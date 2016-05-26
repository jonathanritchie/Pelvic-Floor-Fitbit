//
//  SecondViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 16/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    let hasEventForDate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.clipsToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addReminderButtonPressed(sender: UIButton) {
    
        let deselected = deselectDays(calendar)
        
        if deselected {
            
            let alertController = UIAlertController(title: "Reminders Added", message: nil, preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            displayNoDatesSelectedAlert()
        }
        
        for day in calendar.selectedDates {
            calendar.deselectDate(day as! NSDate)
        }
    }
    
    @IBAction func removeReminderButtonPressed(sender: UIButton) {
        
        let deselected = deselectDays(calendar)
        
        if deselected {
            
            let alertController = UIAlertController(title: "Reminders Removed", message: nil, preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            displayNoDatesSelectedAlert()
        }
        
        for day in calendar.selectedDates {
            calendar.deselectDate(day as! NSDate)
        }

    }
    
    private func deselectDays(calendar: FSCalendar) -> Bool {
        
        let selectedDays: NSArray = calendar.selectedDates
            
        if selectedDays.count > 0 {
            
            for day in selectedDays {
                calendar.deselectDate(day as! NSDate)
            }
            return true;
        }
        return false;
    }
    
    private func displayNoDatesSelectedAlert() {
        
        let alertController = UIAlertController(title: "No Dates Selected", message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

}

