//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Jackie Pan on 4/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(q: "A slug's blood is green.", c: nil, a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", c: nil, a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", c: nil, a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", c: nil, a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", c: nil, a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", c: nil, a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", c: nil, a: "False"),
        Question(q: "Google was originally called 'Backrub'.", c: nil, a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", c: nil, a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", c: nil, a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", c: nil, a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", c: nil, a: "True"),
        // Mutiple choice starts here
        Question(q: "Which is the largest organ in the human body?", c: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", c: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", c: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", c: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", c: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", c: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", c: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", c: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", c: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", c: ["Indonesia", "Australia", "Scotland"], a: "Australia")
        ]
    
    var questionNumber: Int = 0
    var currentScore = 0
    
    
    mutating func checkAnswer (_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].answer {
            currentScore += 1
            return true
        } else {
            return false
        }
    }
    
    func questionType() -> Bool{
        
        if quiz[questionNumber].choices != nil {
            return true
        } else {
            return false
        }
    }
    
    func getOption1 () -> String{
        if questionType() {
            let option1 = String(quiz[questionNumber].choices![0]!)
            return option1
        } else {
            let option1 = "True"
            return option1
        }
    }
    
    func getOption2 () -> String {
        if questionType() {
            let option2 = String(quiz[questionNumber].choices![1]!)
            return option2
        } else {
            let option2 = "False"
            return option2
        }
    }
    
    func  getOption3 () -> String {
        if questionType() {
            let option3 = String(quiz[questionNumber].choices![2]!)
            return option3
        } else {
            let option3: String? = nil
            return option3 ?? ""
        }
    }
    
    func getQuestionText () -> String{
        return quiz[questionNumber].text
    }
    
    func getProgress () -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion () {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            currentScore = 0
        }
    }
    
    func getScore () -> Int{
        return currentScore
    }
}
