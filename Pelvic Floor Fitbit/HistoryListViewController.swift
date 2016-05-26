//
//  HistoryListViewController.swift
//  Pelvic Floor Fitbit
//
//  Created by Jonathan Ritchie on 24/05/16.
//  Copyright © 2016 Jonathan Ritchie. All rights reserved.
//

import UIKit
import TableViewModel

class HistoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewModel: TableViewModel!
    var topSection: TableSection!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableViewModel = TableViewModel(tableView:self.tableView)
        
        addFeedSection()
        self.performSelector(#selector(HistoryListViewController.insertFeedRow), withObject: nil, afterDelay: 3)
    }
    
    func addFeedSection() {
        // Create the section and add it to the model
        topSection = TableSection()
        topSection.headerTitle = "Workout History"
        topSection.headerHeight = 30
        tableViewModel.addSection(topSection)
        
        // Get the sample data for this section
        let sampleFeed = FeedItem.initialItems()
        
        // Create rows for feed items
        for feedItem in sampleFeed {
            // Create a row for each feed item
            let row = TableRow(cellIdentifier: "FeedCell")
            
            // Configure the cell
            configureFeedRow(row, withFeedItem: feedItem)
            
            // Add the row to the section
            topSection.addRow(row)

        }
    }
    
    func onLike(feedItem: FeedItem) {
        self.alert("Starred: \(feedItem.user.name)")
    }
    
    func onShare(feedItem: FeedItem) {
        self.alert("Removed: \(feedItem.user.name)")
    }
    
    func onUpload(feedItem: FeedItem) {
        self.alert("Uploaded: \(feedItem.user.name)")
    }
    
    func insertFeedRow() {
        topSection.rowAnimation = UITableViewRowAnimation.Left
        let feedItem = FeedItem.toBeAddedLater()
        let row = TableRow(cellIdentifier: "FeedCell")
        configureFeedRow(row, withFeedItem: feedItem)
        topSection.insertRow(row, atIndex: topSection.numberOfRows())
    }
    
    func configureFeedRow(row: TableRow, withFeedItem feedItem: FeedItem) {
        row.configureCell {
            cell in
            let feedCell = cell as! FeedCell
            feedCell.feedItem = feedItem
            feedCell.onLike = self.onLike
            feedCell.onShare = self.onShare
            feedCell.onUpload = self.onUpload
            
            // Cell height will change based on length of the comment. FeedCell will calculate
            // own height based on the feedItem given. We need to set this value as the height
            // of row.
            row.height = feedCell.cellHeight + 10
        }
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) {
            action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
