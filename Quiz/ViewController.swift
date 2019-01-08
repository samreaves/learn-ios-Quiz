//
//  ViewController.swift
//  Quiz
//
//  Created by Sam Reaves on 12/28/18.
//  Copyright © 2018 Sam Reaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    var shouldShowAnswer: Bool = false
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        currentQuestionIndex = currentQuestionIndex > 2 ? 0 : currentQuestionIndex
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLayerTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /* Set label's initial alpha */
        nextQuestionLabel.alpha = 0
    }
    
    func animateLayerTransitions() {
        
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                            self.currentQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
                            self.view.layoutIfNeeded()
                       },
                       completion: { _ in
                            swap(&self.currentQuestionLabel,
                                 &self.nextQuestionLabel)
                        
                            swap(&self.currentQuestionLabelCenterXConstraint,
                                 &self.nextQuestionLabelCenterXConstraint)
                        
                            self.updateOffScreenLabel()
                        
                        
        })
    }
}

