//
//  SegmentViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/2/20.
//

import UIKit

protocol SegmentViewControllerDelegate: class{
    func save(_ state: String)
}

class SegmentViewController: UIViewController {

    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    weak var delegate : SegmentViewControllerDelegate?
    private var status: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segSwitch(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0: output.text = "On"
            status = "Segment Control:    true"
        case 1: output.text = "Off"
            status = "Segment Control:    false"
        default:
            output.text = "loading"
        }
    }
    @IBAction func save(_ sender: Any) {
    
        self.delegate?.save(self.status ?? "loading")
        self.navigationController?.popViewController(animated: true)
    }
    
}
