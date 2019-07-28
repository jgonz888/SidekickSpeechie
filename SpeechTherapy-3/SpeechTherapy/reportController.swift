//
//  reportController.swift
//  SpeechTherapy
//
//  Created by richard alexander orfao abreu on 7/17/19.
//  Copyright © 2019 richard alexander orfao abreu. All rights reserved.
//

import Foundation
import UIKit

class reportController: UIViewController
{
    var clase = CVCWordsDB.sharedInstance
    
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var wrongLabel: UILabel!
    
    @IBOutlet var rightLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    var score = 0
    
    
    @IBAction func reset(_ sender: Any)
    {
        
        //add Alert ( Controlled by actions ) here to check if the user wants to reset the report   2 options ( yes -> Reset everything  | no -> Leave the report ( Review list too) as is )
        
        clase.reviewList.removeAll()
        clase.totalAnswers = 0
        clase.rightAnswers = 0
        clase.wrongAnswers = 0
        
        score = 0
        
        wrongLabel.text = String(clase.wrongAnswers)
        rightLabel.text = String(clase.rightAnswers)
        
        scoreLabel.text = " "

        //Goes back to the Home view
        self.tabBarController!.selectedIndex = 0
        
        clase.resetFlag = true
    
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        wrongLabel.text = String(clase.wrongAnswers)
        rightLabel.text = String(clase.rightAnswers)
        
        clase.totalAnswers = clase.rightAnswers + clase.wrongAnswers
        
        totalLabel.text = String(clase.totalAnswers)
        
        if (clase.totalAnswers != 0)
        {
            score = ( clase.rightAnswers * 100) / clase.totalAnswers /// clase.totalAnswers)
            
            scoreLabel.text = String(score)  + " %"
            
            if score >= 70
            {
                scoreLabel.textColor = UIColor.green
            }
            else
            {
                scoreLabel.textColor = UIColor.red
            }

        }
        else
        {
            scoreLabel.text = " "
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidLoad()
        
        wrongLabel.text = String(clase.wrongAnswers)
        rightLabel.text = String(clase.rightAnswers)
        
        clase.totalAnswers = clase.rightAnswers + clase.wrongAnswers
        
        if (clase.totalAnswers != 0)
        {
            score = ( clase.rightAnswers * 100) / clase.totalAnswers /// clase.totalAnswers)
            
            scoreLabel.text = String(score)  + " %"
            
            if score >= 70
            {
                scoreLabel.textColor = UIColor(red: 0.035, green: 0.65, blue: 0, alpha: 1.00)
            }
            else
            {
                scoreLabel.textColor = UIColor.red
            }
        }
            
        else
        {
            scoreLabel.text = " "
        }
        totalLabel.text = String(clase.totalAnswers)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
}
