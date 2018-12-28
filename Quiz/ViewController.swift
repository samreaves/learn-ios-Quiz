//
//  ViewController.swift
//  Quiz
//
//  Created by Sam Reaves on 12/28/18.
//  Copyright © 2018 Sam Reaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        print("Show next question tapped")
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        print("Show next question tapped")
    }
}

