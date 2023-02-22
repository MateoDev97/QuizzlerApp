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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aAnswerButton: UIButton!
    @IBOutlet weak var bAnswerButton: UIButton!
    @IBOutlet weak var cAnswerButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        aAnswerButton.layer.cornerRadius = 20
        bAnswerButton.layer.cornerRadius = 20
        cAnswerButton.layer.cornerRadius = 20

        
        progressView.progress = 0
        updateUI()
        
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let answerSelected = sender.currentTitle!
        sender.backgroundColor = quizBrain.checkAnswer(answerSelected) ? .green : .red
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.updateUI()
        })
    }
    
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answers = quizBrain.getAnswers()
        aAnswerButton.setTitle(answers[0], for: .normal)
        bAnswerButton.setTitle(answers[1], for: .normal)
        cAnswerButton.setTitle(answers[2], for: .normal)

        progressView.progress = quizBrain.getProgress()
        
        scoreLabel.text = quizBrain.getScoreText()
        
        aAnswerButton.backgroundColor = .clear
        bAnswerButton.backgroundColor = .clear
        cAnswerButton.backgroundColor = .clear
        
    }
}


