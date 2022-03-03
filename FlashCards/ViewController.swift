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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Allows for the main flashcard to toggle between question and answer.
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden = !frontLabel.isHidden
        
        
    }
    
        
    
    
}

