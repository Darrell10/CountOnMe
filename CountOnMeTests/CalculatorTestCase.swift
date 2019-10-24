//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Frederick Port on 12/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//
import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    
    var calculator : Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    // MARK: Ajout des nombres
    
    // Test ajout de nombres
    func testGivenElementsIsEmpty_WhenAdding23_ThenElementsContains23(){
        calculator.tappedNumberButton(numberText: "23")
        XCTAssert(calculator.elements.contains("23"))
    }
    
    // MARK: Test canAddOperator
    
    // Test possibilité d'ajouter un operateur
    func testGivenTestCalculatorIsEmpty_whenAdding25_ThenCanAddOperatorIsTrue() {
        calculator.textCalculator = "25"
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    // Test ajout Opérateur quand un opérateur a déja été saisie
    func testGivenTestCalculatorIsEmpty_WhenAddingMinusOperator_ThenCanAddOperatorIsFalse(){
        calculator.textCalculator = "-"
        XCTAssertFalse(calculator.canAddOperator)
       }
    
    // MARK: Ajout des opérateurs
    
    // Test ajout Opérateur addition
    func testGivenElementsIsEmpty_WhenAddingPlusOperator_ThenElementsContainPlusOperator(){
        calculator.tappedAdditionButton()
        XCTAssertEqual(calculator.textCalculator, " + ")
    }
    
    func testGivenTextCalculatorEqualPlus_WhenAddingPlusOperator_ThenTextCalculatorEqualPLus(){
        calculator.tappedAdditionButton()
        calculator.tappedAdditionButton()
        XCTAssertEqual(calculator.textCalculator, " + ")
    }
    
    // Test ajout Opérateur soustraction
    func testGivenElementsIsEmpty_WhenAddingMinusOperator_ThenElementsContainMinusOperator(){
        calculator.tappedSubstractionButton()
        XCTAssertEqual(calculator.textCalculator, " - ")
    }
    
    func testGivenTextCalculatorEqualMinus_WhenAddingMinusOperator_ThenTextCalculatorEqualMinus(){
        calculator.tappedSubstractionButton()
        calculator.tappedSubstractionButton()
        XCTAssertEqual(calculator.textCalculator, " - ")
    }
    
    // Test ajout Opérateur multiplication
    func testGivenElementsIsEmpty_WhenAddingMultiplicateOperator_ThenElementsContainMultiplicateOperator(){
        calculator.tappedMultiplicateButton()
        XCTAssertEqual(calculator.textCalculator, " * ")
    }
    
    func testGivenTextCalculatorEqualMultiplicate_WhenAddingMultiplicateOperator_ThenTextCalculatorEqualMultiplicate(){
        calculator.tappedMultiplicateButton()
        calculator.tappedMultiplicateButton()
        XCTAssertEqual(calculator.textCalculator, " * ")
    }
    
    // Test ajout Opérateur division
    func testGivenElementsIsEmpty_WhenAddingDivideOperator_ThenElementsContainDivideOperator(){
        calculator.tappedDivideButton()
        XCTAssertEqual(calculator.textCalculator, " / ")
    }
    
    func testGivenTextCalculatorEqualDivide_WhenAddingDivideOperator_ThenTextCalculatorEqualDivide(){
        calculator.tappedDivideButton()
        calculator.tappedDivideButton()
        calculator.operationResult()
        XCTAssertEqual(calculator.textCalculator, " / ")
    }
    
    // MARK: operationResult
    
    func testGivenElementsIsEmpty_WhenAddingEqual_ThenTextcalculatorIsEmpty(){
        calculator.operationResult()
        XCTAssertEqual(calculator.textCalculator, "")
    }
    
    func test7(){
        calculator.tappedNumberButton(numberText: "2")
        calculator.tappedDivideButton()
        calculator.tappedNumberButton(numberText: "2")
        calculator.operationResult()
        calculator.tappedNumberButton(numberText: "2")
        XCTAssertEqual(calculator.textCalculator, "2")
    }
    
    
    // Test calcul soustraction
    func testGivenElementsIsEmpty_WhenAdding13Minus7_ThenResultIsEqualTo6(){
        calculator.tappedNumberButton(numberText: "13")
        calculator.tappedSubstractionButton()
        calculator.tappedNumberButton(numberText: "7")
        calculator.operationResult()
        XCTAssertEqual(calculator.textCalculator, "13 - 7 = 6")
    }
    
    
    // test calcul priorité
    
    func testGivenElementsIsEmpty_WhenAdding2Plus3Multiplicate4_ThenResultIsEqualTo14(){
        calculator.tappedNumberButton(numberText: "2")
        calculator.tappedAdditionButton()
        calculator.tappedNumberButton(numberText: "3")
        calculator.tappedMultiplicateButton()
        calculator.tappedNumberButton(numberText: "4")
        calculator.operationResult()
        XCTAssertEqual(calculator.textCalculator, "2 + 3 * 4 = 14")
    }
    
    // Test boutton AC
    
    func testGivenElementsIs25Plus7_WhenClearTextCalculator_ThenTextCalculatorIsEmpty(){
        calculator.resetButton()
        XCTAssertEqual(calculator.textCalculator, "")
    }

}
