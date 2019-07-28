//
//  CVCWordList, ShortVowelList, RhymeWordList
//  SpeechTherapy
//
// PROGRAMMER:  Jennifer Gonzalez
// PANTHERID:   3007614
//


import Foundation
import UIKit

class CVCWordList: UITableViewController, UISearchBarDelegate
{
    
    var myCVCList = CVCWordsDB.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()   //reload data everytime view appears
        
    }

    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCVCList.catList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //load the table view cells
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let thisCat = myCVCList.catList[indexPath.row]
        
        cell.textLabel?.text = thisCat
        
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        let shortList = segue.destination as? ShortVowelList
        
        switch(segue.identifier ?? "") {
            
        case "ShortVowelList":  //show the selected contact's info for editing
            
            let selectedItemCell = sender as? UITableViewCell
            
            let indexPath = tableView.indexPath (for: selectedItemCell!)
            
            //shortlist.selectedIndex = indexPath?.row
            
            let selectedItem = myCVCList.catList[(indexPath?.row)!]
            
            shortList?.aVowelList = selectedItem
            
            //case "AddItem":  //prepare to add a new word
            
            //  info needed to add a new item goes here
            
        default:
            print ("Error")
        }
        
    }
    
}




class ShortVowelList: UITableViewController, UISearchBarDelegate
{
    
    var myCatList = CVCWordsDB.sharedInstance
    var aVowelList: String!
    var thisVowelList: [String]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        findList()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        findList()
        tableView.reloadData()   //reload data everytime view appears
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func findList()
    { //We can probably move this to the Singleton class but im leaving it here for now
        
        switch aVowelList
        {
        case "Short A":
            thisVowelList = myCatList.shortAList
        case "Short E":
            thisVowelList = myCatList.shortEList
        case "Short I":
            thisVowelList = myCatList.shortIList
        case "Short O":
            thisVowelList = myCatList.shortOList
        case "Short U":
            thisVowelList = myCatList.shortUList
        default:
            print ("Error")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return thisVowelList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //load the table view cells
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let thisCat = thisVowelList[indexPath.row]
        cell.textLabel?.text = thisCat
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        let rhymeWordList = segue.destination as? RhymeWordList
        
        switch(segue.identifier ?? "") {
            
        case "Rhyme":  //show the selected contact's info for editing
            
            //rhymeWordList?.isNew = false
            
            let selectedItemCell = sender as? UITableViewCell
            
            let indexPath = tableView.indexPath (for: selectedItemCell!)
            
            //rhymeWordList?.selectedIndex = indexPath?.row
            
            let selectedItem = thisVowelList[(indexPath?.row)!]
            
            rhymeWordList?.aRhymeList = selectedItem
            
            //case "AddItem":  //prepare to add a new word
            
            //  info needed to add a new item goes here
            
        default:
            print ("Error")
        }
        
    }
    
}

class RhymeWordList: UITableViewController, UISearchBarDelegate
{
    
    var myCatList = CVCWordsDB.sharedInstance
    var aRhymeList: String!
    var thisRhymeList: [String]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        findList()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        findList()
        tableView.reloadData()   //reload data everytime view appears

    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func findList()
    { //We can probably move this to the Singleton class but im leaving it here for now
        switch aRhymeList
        {
        case "ab":
            thisRhymeList = myCatList.abList
        case "at":
            thisRhymeList = myCatList.atList
        case "ad":
            thisRhymeList = myCatList.adList
        case "ed":
            thisRhymeList = myCatList.edList
        case "eg":
            thisRhymeList = myCatList.egList
        case "et":
            thisRhymeList = myCatList.etList
        case "it":
            thisRhymeList = myCatList.itList
        case "id":
            thisRhymeList = myCatList.idList
        case "ig":
            thisRhymeList = myCatList.igList
        case "ot":
            thisRhymeList = myCatList.otList
        case "ob":
            thisRhymeList = myCatList.obList
        case "og":
            thisRhymeList = myCatList.ogList
        case "ut":
            thisRhymeList = myCatList.utList
        case "ub":
            thisRhymeList = myCatList.ubList
        case "ug":
            thisRhymeList = myCatList.ugList
        
        default:
            print ("Error")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return thisRhymeList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //load the table view cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let thisCat = thisRhymeList[indexPath.row]
        cell.textLabel?.text = thisCat
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        let flashCard = segue.destination as? FlashCard
        
        switch(segue.identifier ?? "") {
            
        case "Flash":  //show the selected contact's info for editing
            
            let selectedItemCell = sender as? UITableViewCell
            
            let indexPath = tableView.indexPath (for: selectedItemCell!)
            
            flashCard?.selectedIndex = (indexPath?.row)!
            
            let selectedItem = thisRhymeList[(indexPath?.row)!]
            
            flashCard?.thisWord = selectedItem  //ensure the flashcard begins with the word selected
            
            flashCard?.thisCVCList = thisRhymeList
            
        default:
            print ("Error")
        }
        
    }
    
    

    
}

