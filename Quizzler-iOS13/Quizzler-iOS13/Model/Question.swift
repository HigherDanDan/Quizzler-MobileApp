//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jackie Pan on 4/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    var choices: [String?]? = nil
    let answer: String
    
    
    init(q: String, c: [String]?, a: String) {
        text = q
        choices = c
        answer = a
    }

}
