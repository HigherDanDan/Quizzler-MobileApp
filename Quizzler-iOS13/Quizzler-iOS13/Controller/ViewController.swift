//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            questionLabel.text = "Correct"
        } else {
            sender.backgroundColor = UIColor.red
            questionLabel.text = "Wrong"
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.updateUI()
//        }
        
    }
    
    @objc func updateUI() {
        
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "\(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
    
        let isMultipleChoice = quizBrain.questionType()
        
        if isMultipleChoice {
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button3.backgroundColor = UIColor.clear
            button1.setTitle("\(quizBrain.getOption1())", for: UIControl.State.normal)
            button2.setTitle("\(quizBrain.getOption2())", for: UIControl.State.normal)
            button3.setTitle("\(quizBrain.getOption3())", for: UIControl.State.normal)
        } else {
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = true
            button3.backgroundColor = UIColor.clear
            button1.setTitle("\(quizBrain.getOption1())", for: UIControl.State.normal)
            button2.setTitle("\(quizBrain.getOption2())", for: UIControl.State.normal)
            button3.setTitle("\(quizBrain.getOption3())", for: UIControl.State.normal)
        }
    }
    
}

