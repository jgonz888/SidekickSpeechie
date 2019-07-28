//
//  ReviewController
//  SpeechTherapy
//
// PROGRAMMER:  Jennifer Gonzalez
// PANTHERID:   3007614
//

import Foundation
import UIKit

class ReviewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var reDo: UIButton!
    var myReviewList = CVCWordsDB.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func loadList()
    {
        //load data here
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //tableView.reloadData()   //reload data everytime view appears
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return myReviewList.reviewList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //load the table view cells
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let thisList = myReviewList.reviewList[indexPath.row]
        
        cell.textLabel?.text = thisList
        
        return cell
        
    }

}
