//
//  addWordController.swift
//  SpeechTherapy
//
//  Created by Richard Orfao on 7/24/19.
//  Copyright © 2019 richard alexander orfao abreu. All rights reserved.
//

import UIKit

class addWordController: UIViewController
{
    @IBOutlet weak var wordLabel: UITextField!
    
    var thisWord: String!
    
    var thisCVCList: [String]!
    
    var myCVCList = CVCWordsDB.sharedInstance

    override func viewWillAppear(_ animated: Bool)
    {
        
        wordLabel.text = ""
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        addWordToList()
        
    }
    
    
    
    func addWordToList()
    {
        if wordLabel.text != ""
        {
            
            //CVCWordsDB.sharedInstance.addWord(wordName: wordLabel.text!)
            
            //CVCWordsDB.sharedInstance.aList.append(wordLabel.text!)
            
            var newWord:String!
            
            newWord = wordLabel.text!
            
            
            myCVCList.addWord(wordName: newWord)
            
            //print(CVCWordsDB.sharedInstance.egList)
            
            
            //print(CVCWordsDB.sharedInstance.aList)
            
            //Goes back to the Home view
            //self.tabBarController!.selectedIndex = 0
            
            //print (CVCWordsDB.sharedInstance.egList)
        }
        else
        {
            
        }
        //thisCVCList.append()
    }
    
    
    
}
