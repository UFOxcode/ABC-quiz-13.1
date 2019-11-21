//
//  ViewController.swift
//  ABC quiz
//
//  Created by UFO Xcode on 2019/11/20.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let pickAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(pickAnswer: pickAnswer)
        
        if isCorrect {
//            print(" GOOD job")
            noteLabel.text = " 答對了!下一題"
            noteLabel.backgroundColor = UIColor.green
            qLabel.backgroundColor = UIColor.green
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        } else {
//            print("Wrong")
            noteLabel.text = "答錯了，再試試！"
            noteLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
        
        
        
    }
   
    
    
    @objc func updateUI(){
        qLabel.backgroundColor = UIColor.clear
        noteLabel.text = "請選答案"
        noteLabel.backgroundColor = UIColor.clear
        qLabel.text = quizBrain.getQuestionText()
        let aChoice = quizBrain.getAnswers()
        choice1.setTitle(aChoice[0], for: .normal)
        choice2.setTitle(aChoice[1], for: .normal)
        choice3.setTitle(aChoice[2], for: .normal)
        choice4.setTitle(aChoice[3], for: .normal)
        
        
        
        
    }
}

