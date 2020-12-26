//
//  InterfaceController.swift
//  SalavatCounter WatchKit Extension
//
//  Created by Seyed Ali Shahrokhi on 7/16/1399 AP.
//

import WatchKit
import Foundation

var Count = 0
let defaults = UserDefaults.standard
class InterfaceController: WKInterfaceController {
    @IBOutlet weak var CounterLable: WKInterfaceLabel!
    @IBOutlet weak var CountBtn: WKInterfaceButton!
    @IBOutlet weak var RestBtn: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    @IBAction func CountTapped() {
        Count = Count+1
        CounterLable.setText(String(Count))
        defaults.set(Count, forKey: "Count")
    }
    @IBAction func ResetTapped() {
        Count = 0
        CounterLable.setText(String(Count))
        defaults.set(Count, forKey: "Count")
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        let Counter = defaults.integer(forKey: "Count")
        CounterLable.setText(String(Counter))
        
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}
