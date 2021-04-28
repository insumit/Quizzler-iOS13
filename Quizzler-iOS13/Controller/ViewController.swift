//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionBrain = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let correctAnswer = questionBrain.checkAnswer(userAnswer)
        
        if correctAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        questionBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeUI),userInfo: nil, repeats: false)
    }
    
    @objc func changeUI() {
        questionText.text = questionBrain.getQuizText()
        progressView.progress = questionBrain.getProgress()
        scoreLabel.text = "Score: \(questionBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

