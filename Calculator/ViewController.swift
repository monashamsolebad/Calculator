//
//  ViewController.swift
//  Calculator
//
//  Created by Mona Shamsolebad on 2019-08-20.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCalculation.text = "0"
      
    }
    var firstValue = true
    var subTotal: Int?
    var lastOperator: operatorType?
    
    enum operatorType {
        case plus
        case subtract
        case multiply
        case divide
    }
    
    @IBOutlet  var displayCalculation: UILabel!
    
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        displayCalculation.text = "0"
        firstValue = true;
        subTotal = nil
        lastOperator = nil
    }
    
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard var text = sender.titleLabel?.text else { return }
        if firstValue {
           
            displayCalculation.text = text
            firstValue = false
        }
        else {
            displayCalculation.text =  displayCalculation.text! + text
        }
        
        
//        switch text {
//        case "1":
//            if firstValue {
//                displayCalculation.text = "1"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "1"
//            }
//        case "2":
//            if firstValue {
//                displayCalculation.text = "2"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "2"
//            }
//        case "3":
//            if firstValue {
//                displayCalculation.text = "3"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "3"
//            }
//        case "4":
//            if firstValue {
//                displayCalculation.text = "4"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "4"
//            }
//        case "5":
//            if firstValue {
//                displayCalculation.text = "5"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "5"
//            }
//        case "6":
//            if firstValue {
//                displayCalculation.text = "6"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "6"
//            }
//        case "7":
//            if firstValue {
//                displayCalculation.text = "7"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "7"
//            }
//        case "8":
//            if firstValue {
//                displayCalculation.text = "8"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "8"
//            }
//        case "9":
//            if firstValue {
//                displayCalculation.text = "9"
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "9"
//            }
//        case "0":
//            if firstValue {
//                displayCalculation.text = "0"
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "0"
//            }
//        case ".":
//            if firstValue {
//                displayCalculation.text = "0."
//                firstValue = false
//            }
//            else {
//                displayCalculation.text =  displayCalculation.text! + "."
//            }
//        default:
//            displayCalculation.text = "0"
//        }
//
    }
    //    let formatter: NumberFormatter = {
    //        let fm = NumberFormatter()
    //        fm.numberStyle = .decimal
    //        fm.maximumFractionDigits = 1
    //        return fm
    //    }()
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        let secondOperand = Int(displayCalculation.text!)!
        if let currentSubTotal = subTotal {
            switch lastOperator! {
            case .plus:
                subTotal = secondOperand + currentSubTotal
            case .subtract:
                subTotal = currentSubTotal - secondOperand
            case .multiply:
                subTotal = secondOperand * currentSubTotal
            case .divide:
                subTotal = secondOperand / currentSubTotal
            }
        }
        else
        {
            subTotal = secondOperand
        }
        switch text {
        case "+":
            lastOperator = .plus
        case "-":
            lastOperator = .subtract
        case "*":
            lastOperator = .multiply
        case "/":
            lastOperator = .divide
        default:
            subTotal = 0
        }
        firstValue = true
        displayCalculation.text = "\(subTotal!)"
    }
    let formatter: NumberFormatter = {
        let fm = NumberFormatter()
        fm.numberStyle = .decimal
        fm.maximumFractionDigits = 1
        return fm
    }()
    
    @IBAction func equalTapped(_ sender: Any) {
        var result = subTotal!
        
        let secondOperand = Int(displayCalculation.text!)!
        if let finalOperator = lastOperator {
            switch (finalOperator) {
            case .plus:
                result = subTotal! + secondOperand
            case .subtract:
                result = subTotal! - secondOperand
            case .multiply:
                result = subTotal! * secondOperand
            case .divide:
                result = subTotal! / secondOperand
            }
        }
        displayCalculation.text = "\(result)"
        subTotal = nil
        firstValue = true
        
    }
}
