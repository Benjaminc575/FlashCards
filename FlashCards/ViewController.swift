//
//  ViewController.swift
//  FlashCards
//
//  Created by Benjamin Cardenas on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    
    @IBOutlet weak var btnOptionTwo: UIButton!
    
    @IBOutlet weak var btnOptionThree: UIButton!
    
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
        
        
        
    }
    
    // Allows for the main flashcard to toggle between question and answer.
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden = !frontLabel.isHidden
        
        
    }
    //updates the question and answer
    func updateFlashcard(question: String, answer: String) {
        frontLabel.text = question
        backLabel.text = answer
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //we know the destination of the segue is the Navigation controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //we set the flashcardController property to self
        creationController.flashcardsController = self
    }
 
    

}
    
    
    
        
    
    

