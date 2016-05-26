//
//  TabBar.swift
//  
//
//  Created by Jonathan Ritchie on 26/05/16.
//
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let guideURL = NSBundle.mainBundle().URLForResource("UserGuide", withExtension: "json")!
        let viewController = SherpaViewController(fileAtURL: guideURL)
        self.viewControllers?.append(viewController)
        self.tabBar.items?.last?.image = UIImage(named: "Help-50")
        self.tabBar.items?.last?.title = "Help"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
