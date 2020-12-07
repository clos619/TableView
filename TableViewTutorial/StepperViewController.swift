//
//  StepperViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/7/20.
//

import UIKit

protocol StepperViewControllerDelegate: class{
    func save(_ value: String)
}

class StepperViewController: UIViewController {

    weak var delegate: StepperViewControllerDelegate?
    @IBOutlet weak var stepper: UIStepper!

    @IBOutlet weak var stepOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        self.delegate?.save(self.stepOutput.text ?? "loading")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepper(_ sender: Any) {
        let currentValue = Int(stepper.value)
                stepOutput.text = "Stepper: \(currentValue)"
    }
    
}
