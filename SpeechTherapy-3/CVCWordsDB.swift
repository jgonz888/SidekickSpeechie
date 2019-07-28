// PROGRAMMERS:  Jennifer & Richard
// Due to time constraints, we were unable to rewire the program with Core Data


import Foundation
import UIKit

//We should probably incorporate a struct here to bind words to images


final class CVCWordsDB
{
    static let sharedInstance = CVCWordsDB ()
    
    //vowel category
    var catList: [String] = ["Short A", "Short E", "Short I", "Short O", "Short U"]
    
    //rhyme lists
    var shortAList: [String] = ["ab", "at", "ad"]
    
    var shortEList: [String] = ["ed", "eg", "et"]
    
    var shortIList: [String] = ["it", "id", "ig"]
    
    var shortOList: [String] = ["ot", "ob", "og"]
    
    var shortUList: [String] = ["ut", "ub", "ug"]
    
    
    //word lists
    var abList: [String] = ["cab", "dab", "gab", "jab", "lab", "nab", "tab", "blab", "crab", "grab", "scab"]
    
    var atList: [String] = ["bat", "cat", "fat", "at", "mat", "pat", "rat", "sat", "vat", "brat", "chat", "flat"]
    
    var adList: [String] = ["bad", "dad", "had", "lad", "mad", "pad", "sad", "tad", "glad"]
    
    var edList: [String] = ["bed", "fed", "led", "red", "wed", "bled", "bred", "fled", "pled", "sled", "shed"]
    
    var egList: [String] = ["beg", "keg", "leg", "peg"]
    
    var etList: [String] = ["bet", "get", "jet", "let", "met", "net", "pet", "set", "vet", "wet", "yet", "fret"]
    
    var itList: [String] = ["bit", "fit", "hit", "kit", "lit", "pit", "sit", "wit", "knit", "quit", "slit", "spit"]
    
    var idList: [String] = ["bid", "did", "hid", "kid", "lid", "rid", "skid", "slid"]
    
    var igList: [String] = ["big", "dig", "fig", "gig", "jig", "pig", "rig", "wig", "zig", "twig"]
    
    var otList: [String] = ["cot", "dot", "got", "hot", "jot", "lot", "not", "pot", "rot", "tot", "blot", "knot", "plot", "shot", "slot", "spot"]
    
    var obList: [String] = ["cob", "gob", "job", "lob", "mob", "rob", "sob", "blob", "glob", "knob", "slob", "snob"]
    
    var ogList: [String] = ["bog", "cog", "dog", "fog", "hog", "jog", "log", "blog", "clog", "frog"]
    
    var utList: [String] = ["but", "cut", "gut", "hut", "jut", "nut", "rut", "shut"]
    
    var ubList: [String] = ["cub", "hub", "nub", "rub", "sub", "tub", "grub", "snub", "stub"]
    
    var ugList: [String] = ["bug", "dug", "hug", "jug", "lug", "mug", "pug", "rug", "tug", "drug", "plug", "slug", "snug"]
    
    //Review List
    
    var reviewList: [String] = []
    //var reviewList: [String]!
    
    //Report numbers
    var wrongAnswers = 0
    var rightAnswers = 0
    var totalAnswers = 0
    
    var firstName = ""
    var lastName = ""
    var patientID = ""
    
    var reset = 1
    
    var resetFlag = false
    
    //var totalAnswers = self.rightAnswers + self.wrongAnswers
    
    
    //functions
    var displayIndex = -1
    
    var aList: [String]!  //used only for the flashcard page
    
    //review.append("TESTING")
    
    func nextWord () -> String
    {
        
        displayIndex += 1
        if displayIndex >= aList.count
        {
            displayIndex = 0
        }
        
        return aList [displayIndex]
        
    } // nextWord
    
    
    func prevWord () -> String
    {
        
        displayIndex -= 1
        if displayIndex < 0
        {
            displayIndex = aList.count-1
        }
        
        return aList [displayIndex]
        
    } // prevWord
    
    
    
    func addRhyme(rhymeName:String)
    {
        
        if rhymeName.contains("A")
        {
            shortAList.append(rhymeName)
            //var newListName = rhymeName + "List"
            //var newListName : [String]
        }
        else if rhymeName.contains("E")
        {
            shortEList.append(rhymeName)
        }
        else if rhymeName.contains("I")
        {
            shortIList.append(rhymeName)
        }
        else if rhymeName.contains("O")
        {
            shortOList.append(rhymeName)
        }
        else if rhymeName.contains("U")
        {
            shortUList.append(rhymeName)
        }
        
    }
    
    
    
    func addWord(wordName:String)
    {
        if wordName.contains("ab")
        {
            abList.append(wordName)
        }
        else if wordName.contains("at")
        {
            atList.append(wordName)
        }
        else if wordName.contains("ed")
        {
            edList.append(wordName)
        }
        else if wordName.contains("eg")
        {
            egList.append(wordName)
        }
        else if wordName.contains("et")
        {
            etList.append(wordName)
        }
        else if wordName.contains("it")
        {
            itList.append(wordName)
        }
        else if wordName.contains("id")
        {
            idList.append(wordName)
        }
        else if wordName.contains("ig")
        {
            igList.append(wordName)
        }
        else if wordName.contains("ot")
        {
            otList.append(wordName)
        }
        else if wordName.contains("ob")
        {
            obList.append(wordName)
        }
        else if wordName.contains("og")
        {
            ogList.append(wordName)
        }
        else if wordName.contains("ut")
        {
            utList.append(wordName)
        }
        else if wordName.contains("ub")
        {
            ubList.append(wordName)
        }
        else if wordName.contains("ug")
        {
            ugList.append(wordName)
        }
        else
        {
        //Create a new list and a add the word to it
        }
    }

    
    
} // end


































