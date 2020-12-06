//
//  AddTodoViewController.swift
//  TableViewTutorial
//
//  Created by MAC on 11/30/20.
//

import UIKit

protocol AddTodoViewControllerDelegate: class {
  func addItem(_ item: String)
}

class AddTodoViewController: UIViewController {
  @IBOutlet weak var todoTextField: UITextField!
  
  weak var delegate: AddTodoViewControllerDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func submit(_ sender: Any) {
    if self.todoTextField.text?.isEmpty == false {
      self.delegate?.addItem(self.todoTextField.text ?? "default text")
      self.navigationController?.popViewController(animated: true)
    } else {
      let alert = UIAlertController(title: "ERROR ID10T", message: "Can not add empty todo", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(okAction)
      self.present(alert, animated: true, completion: nil)
    }
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
