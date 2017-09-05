//
//  ViewController.swift
//  Calculator
//
//  Created by Sattar Salambayev on 7/23/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    

    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTyping =  true
        }
    }
    

    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        displayValue = 0
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            //control + I - rended the text
            brain.performOperation(mathSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
        
        
    }
    
}

