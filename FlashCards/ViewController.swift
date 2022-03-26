//
//  ViewController.swift
//  FlashCards
//
//  Created by Benjamin Cardenas on 2/26/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    //var extraAnswer1: String
    //var extraAnswer2: String
    //TODO: ADD EXTRA ANSWERS TO STRUCT
}

class ViewController: UIViewController {

    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    // Array to hold pur flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        card.layer.cornerRadius = 20.0 // creates round corners for card
        card.layer.shadowRadius = 15.0 // shadow radius for card
        card.layer.shadowOpacity = 0.3 //shadows opacity for card
        
        frontLabel.layer.cornerRadius = 15.0 // creates rounded card
        frontLabel.clipsToBounds = true // clip front label inside
        backLabel.layer.cornerRadius = 20.0 // creates rounded card
        backLabel.clipsToBounds = true // clip front label inside
        
        //creates the outline and color for button 1
        btnOptionOne.layer.cornerRadius = 15.0
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = UIColor.systemBlue.cgColor
        
        //creates the outline and color for button 2
        btnOptionTwo.layer.cornerRadius = 15.0
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = UIColor.systemBlue.cgColor
        
        //creates the outline and color for button 3
        btnOptionThree.layer.cornerRadius = 15.0
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = UIColor.systemBlue.cgColor
        
        //read saved flashcards
        readSavedFlashcards()
        
        //adding our initial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "Whats is the Capital of Texas?", answer: "Austin", extraAnswer1: "Dallas", extraAnswer2: "El Paso")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        //sets intitial flashcard
        //updateFlashcard(question: "Whats is the Capital of Texas?", answer: "Austin", extraAnswer1: "Dallas", extraAnswer2: "El paso")
        
        
        
    }
    
    // Allows for the main flashcard to toggle between question and answer.
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden = !frontLabel.isHidden
        
        
    }
    //updates the question and answer
    //TODO: FIX EXTRA ANSWERS SO THAT THEY UPDATE
    func updateFlashcard(question: String, answer: String, extraAnswer1: String, extraAnswer2: String) {
        
        let flashcard = Flashcard(question: question, answer: answer)

        //Adding flashcard in the flashcard array
        flashcards.append(flashcard)
        
        //Logging to console
        print("😎 Added new Flashcard")
        print("😎 Now we have \(flashcards.count) flashcards.")
        
        //Update current index
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        
        //Update buttons
        updateNextPrevButtons()
        
        //update labels
        updateLabels()
        
        btnOptionOne.setTitle(extraAnswer1, for: .normal)
        //btnOptionTwo.setTitle(answer, for: .normal)
        btnOptionThree.setTitle(extraAnswer2, for: .normal)
        
        //saves all flashcards to UserDefault
        saveAllFlashcardsToDisk()
        
    }
    //function to update labels
    func updateLabels() {
        //get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        //btnOptionOne.setTitle(currentFlashcard.extraAnswer1, for: .normal)
        //btnOptionTwo.setTitle(currentFlashcard.answer, for: .normal)
        //btnOptionThree.setTitle(currentFlashcard.extraAnswer2, for: .normal)
        
        
        
    }
    //function for updating next and prev buttons
    func updateNextPrevButtons() {
        
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        //Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
        
        
    }
    //function to save all flashcards to UserDefaults
    func saveAllFlashcardsToDisk() {
        
        //From flashcard array to dictionnary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        //save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
            
        // log in
        print("Flash cards saved to UserDefaults")
    }
    //reads the saved flashcards
    func readSavedFlashcards() {
        //read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            // in here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            //put all these cards in our flashcard array
            flashcards.append(contentsOf: savedCards)
        }
        
        
    }
    //hides option 1 when tapped
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    //hides option 2 when tapped and displays frontLabel(Answer)
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    //hides option 3 when tapped and displays 
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
        
    }
    //Next button
    @IBAction func didTapOnNext(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        
        //update buttons
        updateNextPrevButtons()
        
    }
    //prev Button
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //decreases current index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        
    }
    //delete button
    @IBAction func didTapOnDelete(_ sender: Any) {
        //show confirmation
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        present(alert, animated: true) //presents the alert
        
        // Adds the delete option
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
            
        }
        alert.addAction(deleteAction)
        
        //Adds the cancel Option
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        
    }
    //func to deltete a flashcard
    func deleteCurrentFlashcard() {
        
        //Delete current
        flashcards.remove(at: currentIndex)
        
        //Special case: Check if last card was deleted
        if currentIndex > flashcards.count - 1 {
            currentIndex = flashcards.count - 1
            
        }
        updateLabels()
        updateNextPrevButtons()
        saveAllFlashcardsToDisk()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //we know the destination of the segue is the Navigation controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //we set the flashcardController property to self
        creationController.flashcardsController = self
        
        // Set initial values segue's identifier is EditSegue
        if segue.identifier == "EditSegue" {
            
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            creationController.initialExtraAnswer1 = btnOptionOne.currentTitle
            creationController.initialExtraAnswer2 = btnOptionThree.currentTitle
            
        }
        
    }
 
    

}
    
    
    
        
    
    

