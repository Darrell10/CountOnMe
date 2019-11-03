//
//  Calculator.swift
//  CountOnMe
//
//  Created by Frederick Port on 03/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.

import Foundation

class Calculator {
    weak var delegateDisplay: DisplayDelegate?
    // MARK: - Property
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
        //return elements.firstIndex(of: "=") != nil
        return textCalculator.contains("=")
    }
    var divideByZero: Bool {
        return !textCalculator.contains("/ 0")
    }
}
// MARK: - numbers and operand Function's
extension Calculator {
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
    // Reset function
    func resetButton() {
        textCalculator = ""
    }
}
// MARK: - Result Function
extension Calculator {
    func operationResult(){
        guard expressionIsCorrect else {
            delegateDisplay?.presentAlert(message: "Entrez une expression correcte !")
            return
        }
        guard expressionHaveEnoughElement else {
            delegateDisplay?.presentAlert(message: "Ajouter un opérateur et un autre chiffre !")
            return
        }
        guard divideByZero else {
            delegateDisplay?.presentAlert(message: "Division par zéro impossible !")
            textCalculator = ""
            return
        }
        convertStringToFloat()
        guard let result = NSExpression(format: textCalculator).expressionValue(with: nil, context: nil) else { return }
        textCalculator = ("= \(result)")
    }
    // Function to convert String To Float
    private func convertStringToFloat(){
        var stringTmp = [String]()
        for element in elements {
            if element == "+" || element == "-" || element == "/" || element == "*" {
                stringTmp.append(element)
            } else {
                let floatNumber = String(format: "%.2f", (element as NSString).floatValue)
                stringTmp.append(floatNumber)
            }
        }
        textCalculator = stringTmp.joined(separator: " ")
    }
}
// MARK: - Alert Display Protocol
protocol DisplayDelegate: class {
    func presentDisplay(text: String)
    func presentAlert(message: String)
}


