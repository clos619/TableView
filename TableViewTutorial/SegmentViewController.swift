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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segSwitch(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0: output.text = "High"
        case 1: output.text = "low"
        default:
            output.text = "loading"
        }
    }
    @IBAction func save(_ sender: Any) {
    }
    
}
