//
//  ViewController.swift
//  ABC quiz
//
//  Created by UFO Xcode on 2019/11/20.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    var quizBrain = QuizBrain()
    
    var totalQuestion = 10
    var questionIndex = 1
    
    var i = 0
    
    //把 聲音 synthe。拉到上面才可以控制 隨時停。。 真的    👍讚👍 👍
       let synthesizer = AVSpeechSynthesizer()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
      
//        circleLine()
        updateUI()
    }

    fileprivate func speakOut(feedback : String) {
        
//        let synthesizer = AVSpeechSynthesizer()
        // 放在裡面就無法停止。。。。👍， 要 同一個 syn 才可以控制。。
        synthesizer.pauseSpeaking(at: .immediate)
        synthesizer.stopSpeaking(at: .immediate)
        
        let utterance = AVSpeechUtterance(string: feedback)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        
        synthesizer.speak(utterance)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let pickAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(pickAnswer: pickAnswer)
        
        
        if isCorrect {
//            print(" GOOD job")
            noteLabel.text = " 答對了!下一題"
            
            speakOut(feedback: "答對了")
            
            
            
            noteLabel.backgroundColor = UIColor.green
            qLabel.backgroundColor = UIColor.green
            sender.backgroundColor = UIColor.yellow
            
            
            
            Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        } else {
//            print("Wrong")
            noteLabel.text = "答錯了，再試試！"
            
            speakOut(feedback: "答錯了")
            

            
            
            noteLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        }
        
        if questionIndex == 10 {
            print("10題 結束，跳 下一頁")
        }
        questionIndex += 1
        
        quizBrain.nextQuestion()
        
    }
   
    
    
    @objc func updateUI(){
        qLabel.backgroundColor = UIColor.clear
        noteLabel.backgroundColor = UIColor.clear
        choice1.backgroundColor = UIColor.green
        choice2.backgroundColor = UIColor.green
        choice3.backgroundColor = UIColor.green
        choice4.backgroundColor = UIColor.green
        
        progressBar.progress = Float(questionIndex) / Float(totalQuestion)
        
        
        
        noteLabel.text = "請選答案"
        qLabel.text = quizBrain.getQuestionText()
        let aChoice = quizBrain.getAnswers()
        choice1.setTitle(aChoice[0], for: .normal)
        choice2.setTitle(aChoice[1], for: .normal)
        choice3.setTitle(aChoice[2], for: .normal)
        choice4.setTitle(aChoice[3], for: .normal)
        scoreLabel.text = "真確問題-共\(totalQuestion) 題，現在是第 \(questionIndex) 題, 答對題數：\(quizBrain.getScore()) 。"
        
        speakOut(feedback: quizBrain.getQuestionText())
        
        }

   
        
        
    }
