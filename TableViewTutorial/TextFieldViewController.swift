//
//  TextFieldViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/6/20.
//

import UIKit

protocol TextFieldViewControllerDelegate: class{
    func updateText(with newText: String)
}
class TextFieldViewController: UIViewController {

    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var editText: UITextField!
    var editLabel: String?
    weak var delegate: TextFieldViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.status?.text = self.editLabel
    }
    

    @IBAction func save(_ sender: Any) {
        self.delegate?.updateText(with: self.editText.text ?? "default")
                self.navigationController?.popViewController(animated: true)
    }
    
}
