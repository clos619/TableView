//
//  SliderViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/6/20.
//

import UIKit

protocol SliderViewControllerDelegate: class{
    
    func save(_ state: String)
}
class SliderViewController: UIViewController {
    

    var value: Float = 0
    var output: String = ""
    @IBOutlet weak var status: UILabel!
    weak var delegate : SliderViewControllerDelegate?

    @IBOutlet weak var slideControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }

    @IBAction func save(_ sender: Any) {
        
        self.delegate?.save(self.output ?? output)
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func sliderControl(_ sender: Any) {
         value = Float(slideControl.value)
        if value > 0.7{
            
            status.text = "On"
            output = "Slider:         true"
        }else if value > 0.5 && value < 0.7{
            status.text = "Kinda On"
            output = "Slider:    Kinda On"
        }else if value < 0.4 && value > 0{
            status.text = "Going Off"
            output = "Slider:      Going Off"
        }else if value == 0{
            status.text = "Off"
            output = "Slider:      Off"
        }
        
    }
}
