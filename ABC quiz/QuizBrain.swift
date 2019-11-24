//
//  QuizBrain.swift
//  ABC quiz
//
//  Created by UFO Xcode on 2019/11/20.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import Foundation
import AVFoundation
struct QuizBrain {
    
    var index = 0
    var score = 0
    let quiz = [QFormat(text: "現今全世界的低所得國家裡，多少女孩會讀完小學？", answers: ["20％","40％","60％","80%"], correctAnswer: "60％"),QFormat(text: "世界上的多數人是生活在哪裡？", answers: ["低所得國家","中所得國家","高所得國家","北極"], correctAnswer: "中所得國家"),QFormat(text: "在過去20年，全球赤貧人口占總人口的比例是⋯", answers: ["幾乎翻倍","大致不變","幾乎減半","不知道"], correctAnswer: "幾乎減半"),QFormat(text: "現今全球的平均壽命是多少？", answers: ["50歲","60歲","70歲","80歲"], correctAnswer: "70歲"),QFormat(text: "現今全球有20億個兒童，年齡介於0到15歲之間。根據聯合國的估算，到了2100年全球會有多少個兒童？", answers: ["40億","30億","20億","10億"], correctAnswer: "20億"),QFormat(text: "根據聯合國的估算，到了2100年全球會再增加40億人，而主要原因是什麼？", answers: ["兒童人口增加","成年人口增加","老年人口增加","死亡人數大幅減少"], correctAnswer: "成年人口增加"),QFormat(text: "過去100年間，全球死於天災的人數是如何變化？", answers: ["幾乎翻倍","大致不變","幾乎減半","不知道"], correctAnswer: "幾乎減半"),QFormat(text: "現今全球多少2歲兒童有接種疫苗？", answers: ["20％","50％","80％","90%"], correctAnswer: "80％"),QFormat(text: "全球30歲的男性平均接受過10年的學校教育，而同齡的女性平均接受過幾年的學校教育？", answers: ["9年","6年","3年","11年"], correctAnswer: "9年"),QFormat(text: "全球多少人口享有電力？", answers: ["20％","50％","80％","40%"], correctAnswer: "80％")]

        func getQuestionText() -> String {
               
//          let synthesizer = AVSpeechSynthesizer()
//
//          let utterance = AVSpeechUtterance(string: "請問：\(quiz[index].text) 是\(quiz[index].answers) 請作答")
//                utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
//
//                synthesizer.speak(utterance)
          
          
          
            return quiz[index].text
        }

        func getAnswers() -> [String] {
            return quiz[index].answers
        }
     

     
          func getScore () -> Int {
          return score
     }

    mutating func nextQuestion (){
        if index + 1 < quiz.count {
            index += 1
        } else {
            index = 0
        }
    }
    
     mutating func checkAnswer(pickAnswer:String) -> Bool {
        if pickAnswer == quiz[index].correctAnswer {
            score += 1
            return true
        }else {
            return false
        }
    }
    
   
    
}
