//
//  FlashCard
//  SpeechTherapy
//
// PROGRAMMER:  Jennifer Gonzalez & Richard
// PANTHERID:   3007614
//

import Foundation
import UIKit

class FlashCard: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet var aWord: UILabel!
    @IBOutlet var aPicture: UIButton!
    
    @IBOutlet var prevButton: UIButton!
    @IBOutlet var nextButton: UIButton!

    var thisWord: String!
    var thisCVCList: [String]!
    var myCVCList = CVCWordsDB.sharedInstance
    
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedIndex = -1
    
    ///////////////////////////RICHARD////////////////////////////////////
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String: Any])
    {
        // Get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Put that image on the screen in the image view
        imageView.image = image
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takePicture(_ sender: Any)
    {
        let imagePicker = UIImagePickerController()
        // If the device has a camera, take a picture; otherwise,
        // just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagePicker.sourceType = .camera
        }
        else
        {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func addToReview(_ sender: Any)
    {
        
        myCVCList.wrongAnswers+=1
        
        let wordAddedToList: String!
        
        wordAddedToList = aWord.text
        
        myCVCList.reviewList.append(wordAddedToList!)
    }
    
    
    @IBAction func rightAnswerSelected(_ sender: Any)
    {
        
        myCVCList.rightAnswers+=1
        
    }
    
    ///////////////////////////RICHARD END////////////////////////////////////
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadCard ()
        
        myCVCList.totalAnswers+=1
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        loadCard ()
    }
    
    func loadCard ()
    {
        aWord.text = thisWord
        
        myCVCList.aList = thisCVCList
        
        addImage(currentWord: thisWord)
    }
    
    @IBAction func prevPushed(_ sender: UIButton)
    {
        thisWord = myCVCList.prevWord()
        
        aWord.text = thisWord
        self.imageView.image = nil
        
        addImage(currentWord: thisWord)
    }
    
    @IBAction func nextPushed(_ sender: UIButton)
    {
        
        thisWord = myCVCList.nextWord()
        aWord.text = thisWord
        self.imageView.image = nil
        addImage(currentWord: thisWord)
    }
    
    
    
    func addImage(currentWord: String)  //api is a temporary solution to fill the large list of words with an image. call time is lengthy and data should be saved to a CoreData table in the future
    {
        
        let baseURL = "https://pixabay.com/api/"
        let apiKey = "13119060-829d7e44fa5ec155343da0de9"
        let searchUrl = baseURL + "?key=" + apiKey + "&q=" + currentWord + "&image_type=photo&safesearch=true"  //concatinate the API URL, safe search set to true
        let session = URLSession(configuration: .default)  //config session
        
        let myURL = URL(string: searchUrl)!
        let downloadPicURL = session.dataTask(with: myURL) { (data, response, error) in    //API call
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
    
                do {
                    if let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any] {  //data is returned as json document
                        
                        guard let parsedData = json?["hits"] as? [[String: Any]] else { return }  //use the "hits" index that contains the searched data
                           // print(parsedData)
                        if parsedData.isEmpty {     //check for index out of range error
                            print ("search not found")
                            return
                        }
                        else {
                            if let imgUrl = parsedData[0]["largeImageURL"] as? String {   //nagivate to the index that contains the image URL
                                let finalImgUrl = imgUrl
                                self.addImage2(picURL: finalImgUrl)   //call image URL
                            }
                        }
                    }

                }
                
            }
        }
        downloadPicURL.resume()
    }
    
    func addImage2(picURL: String) {
    let pictureURL = URL(string: picURL)!
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: pictureURL) { (data, response, error) in
        // The download has finished.
        if let e = error {
            print("Error downloading cat picture: \(e)")
        } else {
            // No errors found.
            // It would be weird if we didn't have a response, so check for that too.
            if let res = response as? HTTPURLResponse {
                print("Downloaded picture with response code \(res.statusCode)")
                if let imageData = data {
                    // Finally convert that Data into an image and do what you wish with it.
                    let image = UIImage(data: imageData)   //convert the data into a UIImage
                    self.imageView.image = image   //assign it to the UIImageView
                    // Do something with your image.
                } else {
                    print("Couldn't get image: Image is nil")
                }
            } else {
                print("Couldn't get response code for some reason")
            }
        }
    }
    downloadPicTask.resume()
    
        
        
}
    
    

}
