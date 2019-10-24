//
//  Calculator.swift
//  CountOnMe
//
//  Created by Frederick Port on 03/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.

import Foundation

protocol DisplayDelegate: class {
    func presentDisplay(text: String)
    func presentAlert(message: String)
}

class Calculator {
    
    weak var delegateDisplay: DisplayDelegate?
    
    var textCalculator = "" {
        didSet {
            notificationDisplay(textCalculator: textCalculator)
        }
    }
    var elements: [String] {
        return textCalculator.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*"
    }
    
    var expressionHaveResult: Bool {
        return elements.firstIndex(of: "=") != nil
    }
    
    // Send notification to viewController
    func notificationDisplay(textCalculator: String) {
        delegateDisplay?.presentDisplay(text: textCalculator)
    }
    
    // Add Numbers
    func tappedNumberButton(numberText: String) {
        if expressionHaveResult {
            textCalculator = ""
        }
        textCalculator.append(numberText)
    }
    
    // Add Plus Operand
    func tappedAdditionButton() {
        if canAddOperator {
            textCalculator.append(" + ")
        } else {
            delegateDisplay?.presentAlert(message: "Un operateur est déja mis !")
        }
    }
    
    // Add Minus Operand
    func tappedSubstractionButton() {
        if canAddOperator {
            textCalculator.append(" - ")
        } else {
            delegateDisplay?.presentAlert(message: "Un operateur est déja mis !")
        }
    }
    
    // Add Multiplicate Operand
    func tappedMultiplicateButton(){
        if canAddOperator {
            textCalculator.append(" * ")
        } else {
            delegateDisplay?.presentAlert(message: "Un operateur est déja mis !")
        }
    }
    
    // Add Divide Operand
    func tappedDivideButton(){
        if canAddOperator {
            textCalculator.append(" / ")
        } else {
            delegateDisplay?.presentAlert(message: "Un operateur est déja mis !")
        }
    }
    
    // Result Function
    func operationResult(){
        guard expressionIsCorrect else {
            delegateDisplay?.presentAlert(message: "Entrez une expression correcte !")
            return
        }
        guard expressionHaveEnoughElement else {
            delegateDisplay?.presentAlert(message: "Ajouter un opérateur et un autre chiffre !")
            return
        }
        let result = NSExpression(format: textCalculator).expressionValue(with: nil, context: nil) ?? 0
        textCalculator = (textCalculator + " = \(result)")
    }
    
    // Reset function
    func resetButton() {
        textCalculator = ""
    }
}

