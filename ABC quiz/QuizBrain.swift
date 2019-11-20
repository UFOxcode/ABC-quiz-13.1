//
//  QuizBrain.swift
//  ABC quiz
//
//  Created by UFO Xcode on 2019/11/20.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var index = 0

    let quiz = [QFormat(text: "A", answers: ["A","B","C","D"], correctAnswer: "A"),QFormat(text: "B", answers: ["A","B","C","D"], correctAnswer: "B"),QFormat(text: "C", answers: ["A","B","C","D"], correctAnswer: "C")]

        func getQuestionText() -> String {
            return quiz[index].text
        }

        func getAnswers() -> [String] {
            return quiz[index].answers
        }

    mutating func nextQuestion (){
        if index + 1 < quiz.count {
            index += 1
        } else {
            index = 0
        }
    }
    
    func checkAnswer(pickAnswer:String) -> Bool {
        if pickAnswer == quiz[index].correctAnswer {
            //score += 1
            return true
        }else {
            return false
        }
    }
    
   
    
}
