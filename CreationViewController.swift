//
//  CreationViewController.swift
//  FlashCards
//
//  Created by Benjamin Cardenas on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    //needed connections
    
    @IBOutlet weak var extraAnswerTextField1: UITextField!
    @IBOutlet weak var extraAnswerTextField2: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    var initialExtraAnswer1: String?
    var initialExtraAnswer2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        extraAnswerTextField1.text = initialExtraAnswer1
        extraAnswerTextField2.text = initialExtraAnswer2

        // Do any additional setup after loading the view.
    }
    //cancels the pop up page
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text //enables question to be types
        let answerText = answerTextField.text //enables answer to be typed
        let extraAnswerText1 = extraAnswerTextField1.text //enables extra answer1 to be typed
        let extraAnswerText2 = extraAnswerTextField2.text //enables extra answer2 to be typed
        
        //if else statement that brings up alert
        if(questionText == nil || questionText!.isEmpty) {
                    // Show error
                    let alert = UIAlertController(title: "Missing Text", message: "You need a question.", preferredStyle: .alert)
                    
                    present(alert, animated: true)
                    
                    // Allow user to exit error message screen
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    
                } else if (answerText == nil || answerText!.isEmpty) {
                    //creates alert
                    let alert = UIAlertController(title: "Missing Text", message: "You need an answer.", preferredStyle: .alert)
                    present(alert, animated: true) // presents alert
                    
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    
                } else if (extraAnswerText1 == nil || extraAnswerText1!.isEmpty || extraAnswerText2 == nil || extraAnswerText2!.isEmpty) {
                    //creates alert for extra answers
                    let alert = UIAlertController(title: "Missing Text", message: "You need other answers.", preferredStyle: .alert)
                    present(alert, animated: true) // presents alert
                    
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                
                } else {
                    // Call the function to update the flashcard
                    flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswer1: extraAnswerText1!, extraAnswer2: extraAnswerText2!)
                    
                    dismiss(animated: true)
                }
            }
            
            
            
            // Call the function to update the flashcard
            
            
}
