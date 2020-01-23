//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var OneButton: UIButton!
    @IBOutlet weak var TwoButton: UIButton!
    @IBOutlet weak var ThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        sender.backgroundColor = quizBrain.checkAnswer(userAnswer)
        quizBrain.nextQuiz()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change
                self.updateUi()
        }
        
    }
    
    func updateUi(){
        questionLabel.text = quizBrain.getQuiz()
        OneButton.backgroundColor = UIColor.clear
        TwoButton.backgroundColor = UIColor.clear
        ThreeButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let getListAnswer = quizBrain.getListAnswer()
        OneButton.setTitle(getListAnswer[0], for: .normal)
        TwoButton.setTitle(getListAnswer[1], for: .normal)
        ThreeButton.setTitle(getListAnswer[2], for: .normal)
       
    }
    
}

