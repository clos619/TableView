//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by MAC on 11/30/20.
//

import UIKit

class ViewController: UIViewController, SegmentViewControllerDelegate {

    let defaults = UserDefaults.standard
  @IBOutlet weak var todoListTableView: UITableView!
    let value = "test"
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
      
//    self.TheControls[0] = saved
//    self.todoListTableView.reloadData()
  }
}


















//self.TheControls.remove(at: indexPath.row)
//tableView.reloadData()

//    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//    let destination = storyboard.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
//    navigationController?.pushViewController(destination, animated: true)
