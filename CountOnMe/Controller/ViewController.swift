//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var resetTextButton: UIButton!
    
    let calculator = Calculator()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculator.delegateDisplay = self
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        resetTextButton.setTitle("C", for: .normal)
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.tappedNumberButton(numberText: numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculator.tappedAdditionButton()
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculator.tappedSubstractionButton()
    }

    @IBAction func tappedMultiplicateButton(_ sender: UIButton) {
        calculator.tappedMultiplicateButton()
    }
    
    @IBAction func tappedDivideButton(_ sender: UIButton) {
        calculator.tappedDivideButton()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.operationResult()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        calculator.resetButton()
        resetTextButton.setTitle("AC", for: .normal)
        textView.text = "0"
    }
}

extension ViewController: DisplayDelegate {
    func presentAlert(message: String) {
        let alertVC = UIAlertController(title: "Erreur !", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    func presentDisplay(text: String) {
        textView.text = text
    }
}
