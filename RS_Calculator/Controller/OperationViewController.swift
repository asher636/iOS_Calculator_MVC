//
//  ViewController.swift
//  RS_Calculator
//
//  Created by Asher Ahsan on 13.02.22.
//

import UIKit

class OperationViewController: UIViewController {

    @IBOutlet weak var operationLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    var calculator: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetView()
        calculator.reset()
        print(calculator)
    }
    
    private func resetView() {
        self.doneBtn.isEnabled = false
        self.operationLbl.text = "?"
    }

    @IBAction func updateOperation(_ sender: UIButton) {
        if let op = sender.titleLabel?.text {
            self.operationLbl.text = sender.titleLabel?.text
            self.doneBtn.isEnabled = true
            
            calculator.setOperation(op: op)
        } else {
            //display error
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectOp1Segue" {
            let destinationVC = segue.destination as! OperandViewController
            destinationVC.calculator = self.calculator
        }
    }
}

