//
//  ViewController.swift
//  Q3 of 100 random
//
//  Created by Ryan Chang on 2021/2/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageOfQuestion: UIImageView!
    
    @IBOutlet weak var questiionProgressSlider: UISlider!
    
    @IBOutlet weak var numOfQuestionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var Qusetions = [Question]() //產生問題array
    
    var index = 0 // 題目
    
    var count:Int = 1 // 顯示題數
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let question1 = Question(description: "number1", answer: "number1")
        Qusetions.append(question1)
        let question2 = Question(description: "number2", answer: "number2")
        Qusetions.append(question2)
        let question3 = Question(description: "number3", answer: "number3")
        Qusetions.append(question3)
        let question4 = Question(description: "number4", answer: "number4")
        Qusetions.append(question4)
        let question5 = Question(description: "number5", answer: "number5")
        Qusetions.append(question5)
        let question6 = Question(description: "number6", answer: "number6")
        Qusetions.append(question6)
        let question7 = Question(description: "number7", answer: "number7")
        Qusetions.append(question7)
        let question8 = Question(description: "number8", answer: "number8")
        Qusetions.append(question8)
        let question9 = Question(description: "number9", answer: "number9")
        Qusetions.append(question9)
        let question10 = Question(description: "number10", answer: "number10")
        Qusetions.append(question10)

        Qusetions.shuffle() //隨機出題
        
        //設題目的圖片imageView
        imageOfQuestion.image = UIImage(named: Qusetions[index].description)
        answerLabel.text = ""
        numOfQuestionLabel.text = "\(count)/10"
        
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = Qusetions[index].answer
    }
    
    @IBAction func speak(_ sender: UIButton) {
        var speechUtterance = AVSpeechUtterance()
        
        speechUtterance = AVSpeechUtterance(string: "\(answerLabel.text!)")  //說出answerLabel
        speechUtterance.rate = 0.5
        speechUtterance.pitchMultiplier = 1.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
    
        index = index + 1
        count = count + 1
        
        //如題數等於題目數量，將重新為題數1開始
        if count == Qusetions.count + 1{
            index = 0
            count = 1
            Qusetions.shuffle() // 隨機出題
        }
        
        //每次按下按鍵時，UIImageView顯示題目圖案
        imageOfQuestion.image = UIImage(named: Qusetions[index].description)
        //答案label為空字串
        answerLabel.text = ""
        //題數label
        numOfQuestionLabel.text = "\(count)/10"
        //題數連動slider.value
        questiionProgressSlider.value = Float(count)
    
    }
    
    
}

