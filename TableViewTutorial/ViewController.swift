//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by MAC on 11/30/20.
//

import UIKit

class ViewController: UIViewController, SegmentViewControllerDelegate, SliderViewControllerDelegate, TextFieldViewControllerDelegate, StepperViewControllerDelegate {
    func updateText(with newText: String) {
        let textSelectedIndex = self.todoListTableView.indexPathForSelectedRow?.row
                self.values[textSelectedIndex ?? 2] = newText
                self.todoListTableView.reloadData()
    }
    let defaults = UserDefaults.standard
  @IBOutlet weak var todoListTableView: UITableView!
    let value = "test"
    private var values: [Any] = ["0", "Hello", "Enter Text..", "0", "On"]
  private var TheControls = ["Switch:               true","Segmented Control:      true","Slider:     true","TextField:               true","Stepper:               true"]
    
    private var controlValues = ["off"]
  override func viewDidLoad() {
    super.viewDidLoad()
    self.todoListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    self.todoListTableView.dataSource = self
    self.todoListTableView.delegate = self
    
  }
  
  @IBAction func addNewTodo(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let addTodoVC = storyboard.instantiateViewController(withIdentifier: "AddTodoViewController") as! AddTodoViewController
    addTodoVC.delegate = self
    self.navigationController?.pushViewController(addTodoVC, animated: true)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.TheControls.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let todo = self.TheControls[indexPath.row]
    cell.todoLabel.text = todo
    print(indexPath)
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showVC = storyboard.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        let values = showVC.results
        showVC.results = values
        showVC.delegate = self
        self.navigationController?.pushViewController(showVC, animated: true)
    }else if indexPath.row == 1{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let segmentVC = storyboard.instantiateViewController(withIdentifier: "SegmentViewController") as! SegmentViewController
                segmentVC.delegate = self
                self.navigationController?.pushViewController(segmentVC, animated: true)
    }else if indexPath.row == 2{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let sliderVC = storyboard.instantiateViewController(withIdentifier: "SliderViewController") as! SliderViewController
        sliderVC.delegate = self
       
                self.navigationController?.pushViewController(sliderVC, animated: true)
    }else if indexPath.row == 3{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let TextVC = storyboard.instantiateViewController(withIdentifier: "TextFieldViewController") as! TextFieldViewController
        TextVC.delegate = self
       
                self.navigationController?.pushViewController(TextVC, animated: true)
        
    }else if indexPath.row == 4{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let stepVC = storyboard.instantiateViewController(withIdentifier: "StepperViewController") as! StepperViewController
        stepVC.delegate = self
       
                self.navigationController?.pushViewController(stepVC, animated: true)
    }
    
    }
  }
    
extension ViewController: AddTodoViewControllerDelegate {
  func addItem(_ item: String) {
    self.TheControls.append(item)
    self.todoListTableView.reloadData()
  }
}
extension ViewController: ShowViewControllerDelegate {
    func keep(_ results: String) {
        
        
    }
    
    func save(_ newValue: String) {
    if let selectedIndex = self.todoListTableView.indexPathForSelectedRow?.row{
        self.TheControls[selectedIndex] = newValue
            self.todoListTableView.reloadData()
        }

  }

}

