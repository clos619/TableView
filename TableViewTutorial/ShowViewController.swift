//
//  ShowViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/1/20.
//

import UIKit
protocol ShowViewControllerDelegate: class {
    func save(_ newValue: String)
    
    func keep(_ results: String)
}
class ShowViewController: UIViewController {
    @IBOutlet weak var settingsState: UILabel!

    @IBOutlet weak var switcher: UISwitch!
    var newValue: String?
    weak var delegate: ShowViewControllerDelegate?
    var results : String?
    


   
    @IBAction func valueChanged(_ sender: UISwitch) {
        if(sender.isOn){
            settingsState.text = "On"
            self.newValue = "Switch:          true"
            
        }else{
            settingsState.text = "Off"
            self.newValue = "Switch:          false"
        }
        
    }
    @IBAction func save(_ sender: Any) {
        results = settingsState.text
        self.delegate?.save(self.newValue ?? "Switch:           true")
        self.delegate?.keep(self.results!)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsState.text = self.results
//        switcher.addTarget(self, action: #selector(self.valueChanged(_:)), for: .valueChanged)
    }
   
    
    
}

