//
//  ViewController.swift
//  SalavatCounter
//
//  Created by Seyed Ali Shahrokhi on 7/16/1399 AP.
//

import UIKit
import MBCircularProgressBar

var Count = 0
var targeted = 100
let defaults = UserDefaults.standard
class ViewController: UIViewController {
    @IBOutlet weak var BackImage: UIImageView!
    @IBOutlet weak var TargetLable: UILabel!
    @IBOutlet weak var CircularProgressBarView: MBCircularProgressBarView!
    @IBOutlet weak var TargetSelectBtn: UIButton!
    @IBOutlet weak var CountBtn: UIButton!
    
    @IBOutlet weak var TargetTextField: UITextField!
    
    @IBOutlet weak var RestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let Counter = defaults.integer(forKey: "Count")
        Count = defaults.integer(forKey: "Count")
        CircularProgressBarView.value = CGFloat(Counter)
        
        
    }
    @IBAction func CountTapped(_ sender: Any) {
        
        Count += 1
        CircularProgressBarView.value = CGFloat(Count)
        defaults.set(Count, forKey: "Count")
    }
    @IBAction func ResetTapped(_ sender: Any) {
        Count = 0
        CircularProgressBarView.value = CGFloat(Count)
        defaults.set(Count, forKey: "Count")
    }
    @IBAction func SetTargetTapped(_ sender: Any) {
        targeted = Int(TargetTextField.text!) ?? 100
        TargetLable.text = TargetTextField.text
        if let n = NumberFormatter().number(from: TargetTextField.text ?? "100") {
            let f = CGFloat(truncating: n)
            CircularProgressBarView.maxValue = f
        }
        CircularProgressBarView.reloadInputViews()
        CircularProgressBarView.value = CGFloat(Count + 1)
        CircularProgressBarView.value = CGFloat(Count - 1)
    }
    


}

