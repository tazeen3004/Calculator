//
//  ViewController.swift
//  Calculator
//
//  Created by Tazeen on 21/02/17.
//  Copyright © 2017 Tazeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleofTyping = false
    
    @IBAction func appendDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        if userIsInTheMiddleofTyping
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            userIsInTheMiddleofTyping = true
        }
    }
    var operandStack = Array<Double>()

    @IBAction func operate(_ sender: UIButton)
    {
        let operation = sender.currentTitle!
        if userIsInTheMiddleofTyping {
            enter()
        }
        
        switch operation {
        case "+":
            if operandStack.count >= 2 {
                self.displayValue = self.operandStack.removeLast() + self.operandStack.removeLast()
                self.enter()
           
                }
        case "−":
            if operandStack.count >= 2 {
                self.displayValue = self.operandStack.removeLast() - self.operandStack.removeLast()
                self.enter()
                
            }
        case "×":
            if operandStack.count >= 2 {
                self.displayValue = self.operandStack.removeLast() * self.operandStack.removeLast()
                self.enter()
                
            }
        case "÷":
            if operandStack.count >= 2 {
                self.displayValue = self.operandStack.removeLast() / self.operandStack.removeLast()
                self.enter()
                
            }
        default:
            break
        }
    }
   
    @IBAction func enter()
    {
    
        userIsInTheMiddleofTyping = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    var displayValue: Double
    {
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleofTyping = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

