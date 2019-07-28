// PROGRAMMER:  Jennifer Gonzalez
// PANTHERID:   3007614
//

import Foundation
import UIKit

class ReviewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //@IBOutlet weak var tableView: UITableView!
    var myReviewList = CVCWordsDB.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //let statusBarHeight = UIApplication.shared.statusBarFrame.height
        //let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        //tableView.contentInset = insets
        //tableView.scrollIndicatorInsets = insets
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //tableView.reloadData()   //reload data everytime view appears
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myReviewList.reviewList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //load the table view cells
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let thisList = myReviewList.reviewList[indexPath.row]
        
        cell.textLabel?.text = thisList
        
        return cell
    }
}
