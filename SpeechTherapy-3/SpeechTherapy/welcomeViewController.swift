//
//  welcomeViewController.swift
//  SpeechTherapy
//
//  Created by Richard Orfao on 7/27/19.
//  Copyright © 2019 richard alexander orfao abreu. All rights reserved.
//

import Foundation
import UIKit

class welcomeViewController: UIViewController
{
    var clase = CVCWordsDB.sharedInstance
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var patientID: UITextField!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        firstName.text = ""
        lastName.text = ""
        patientID.text = ""
        
    }
    
    
    
    
    @IBAction func StartSession(_ sender: Any)
    {
        
        if firstName.text == ""
        {
            //pop a message
            
            let alert = UIAlertController(title: "Error", message: "Please check the first name TextBox.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                return;
                
            }))
            
            self.present(alert, animated: true)
            
        }
        
        if lastName.text == ""
        {
            //pop a message
            
            let alert = UIAlertController(title: "Error", message: "Please check the last name TextBox.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                return;
                
            }))
            
            self.present(alert, animated: true)
            
        }
        
        if patientID.text == ""
        {
        
            //pop a message
            
            let alert = UIAlertController(title: "Error", message: "Please check the Patient ID TextBox.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                return;
                
            }))
            
            self.present(alert, animated: true)

        
        }
        
        
        clase.firstName = firstName.text!
        clase.lastName = lastName.text!
        clase.patientID = patientID.text!
        
        
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
