//
//  TextFieldViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/6/20.
//

import UIKit

protocol TextFieldViewControllerDelegate: class{
    func save(_ value: String)
}
class TextFieldViewController: UIViewController {

    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var editText: UITextField!
    weak var delegate: TextFieldViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    @IBAction func save(_ sender: Any) {
        guard var currentStats = editText.text else { return }
        self.delegate?.save(currentStats)
                self.navigationController?.popViewController(animated: true)
    }
    
}
