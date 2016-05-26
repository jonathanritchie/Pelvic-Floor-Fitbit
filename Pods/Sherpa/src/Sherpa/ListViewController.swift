//
// Copyright © 2016 Daniel Farrelly
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// *	Redistributions of source code must retain the above copyright notice, this list
//		of conditions and the following disclaimer.
// *	Redistributions in binary form must reproduce the above copyright notice, this
//		list of conditions and the following disclaimer in the documentation and/or
//		other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
// OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import UIKit

internal class ListViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating {

	internal var allowSearch: Bool = true

	// MARK: Instance life cycle

	internal let dataSource: DataSource!

	internal init(dataSource: DataSource!) {
		self.dataSource = dataSource
		super.init(nibName: nil, bundle: nil)
	}

	internal required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	deinit{
		self.searchController?.view.removeFromSuperview()
	}

	// MARK: View life cycle

	private var searchController: UISearchController?

	internal let tableView = UITableView(frame: CGRectZero, style: .Grouped)

	override func loadView() {
		self.view = self.tableView
	}

	override internal func viewDidLoad() {
		super.viewDidLoad()

		self.navigationItem.title = NSLocalizedString("FAQs", comment: "Title for view controller listing FAQs.")

		if self.allowSearch {
			let searchController = UISearchController(searchResultsController: nil)
			if #available(iOS 9.1, *) {
				searchController.obscuresBackgroundDuringPresentation = false
			} else {
				searchController.dimsBackgroundDuringPresentation = false
			}
			searchController.delegate = self
			searchController.searchResultsUpdater = self
			searchController.searchBar.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 44.0)
			searchController.searchBar.tintColor = self.dataSource.document.tintColor
			searchController.searchBar.autoresizingMask = [.FlexibleWidth]
			self.searchController = searchController

			// Sticking the searchBar inside a wrapper stops the tableview trying to be clever with the content size.
			let headerView = UIView(frame: searchController.searchBar.frame)
			headerView.autoresizingMask = [.FlexibleWidth]
			headerView.addSubview(searchController.searchBar)
			self.tableView.tableHeaderView = headerView

			self.definesPresentationContext = true;
		}

		self.tableView.dataSource = self.dataSource
		self.tableView.delegate = self.dataSource
	}

	// MARK: Search results updating

	internal func updateSearchResultsForSearchController(searchController: UISearchController) {
		if !self.allowSearch { return }

		if searchController.active, let query = searchController.searchBar.text where query.characters.count > 0 {
			self.dataSource.query = query
		}
		else {
			self.dataSource.query = nil
		}

		self.tableView.reloadData()
	}

	// MARK: Customising the table view
	

	// MARK: Utilities
	
	internal func selectRowForArticle(article: Article) {
		if let indexPath = self.dataSource.indexPath(article) {
			self.tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .Middle)
		}
	}

}
