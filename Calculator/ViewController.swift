//
//  ViewController.swift
//  Calculator
//
//  Created by Abylaikhan Koshanov on 2/17/20.
//  Copyright © 2020 Abylaikhan Koshanov. All rights reserved.
//

import UIKit
enum Operation:String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNUmber = ""
     var leftValue = ""
     var rightValue = ""
     var result = ""
     var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
    }

    @IBAction func numberPressed(_ sender: UIButton) {
    if runningNUmber.count <= 8{
           runningNUmber += "\(sender.tag)"
           outputLbl.text = runningNUmber
           }
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNUmber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
    if runningNUmber.count <= 7{
           runningNUmber += "."
           outputLbl.text = runningNUmber
           }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
     operation(operation: currentOperation)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    func operation(operation: Operation){
        if currentOperation != .NULL{
            if runningNUmber != ""{
                rightValue = runningNUmber
                runningNUmber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int (Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
        }else{
            leftValue = runningNUmber
            runningNUmber = ""
            currentOperation = operation
        }
    }
}
