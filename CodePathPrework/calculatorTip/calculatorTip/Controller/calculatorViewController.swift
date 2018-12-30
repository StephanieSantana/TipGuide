//
//  calculatorViewController.swift
//  calculatorTip
//
//  Created by Stephanie Santana on 12/29/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {

    
    @IBOutlet weak var billBeforeTip: UITextField!
    
    @IBOutlet weak var calculatedTipAmount: UILabel!
    
    @IBOutlet weak var totalWithTip: UILabel!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var tip = 0.10

    //implementation for segmented control to switch between tip percentage values
    @IBAction func selectedTipAmount(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tip = 0.10;
        case 1:
            tip = 0.15;
        case 2:
            tip = 0.20;
        default:
            tip = 0.10;
            break;
        }
        
    }
 
    @IBOutlet weak var calculateButton: UIButton!
    
    //function for when the calcuate function is pressed
    @IBAction func calculateTip(_ sender: Any) {
        
        //while the bill amount has a value
        let billAmount = Double(self.billBeforeTip.text ?? "") ?? 0
        
        //the tip amount is equal to the bill amount multiplied by the tip percentaged selected
        let tipAmount = (billAmount * tip)
        self.calculatedTipAmount.text = "\(tipAmount)"
        
        //the total is equal to the original bill amount plus the calculated tip amoutn
        let total = (billAmount + tipAmount)
        self.totalWithTip.text = "\(total)"
        
       
        //formats the output labels to have a $ sign and to correct decimal
        calculatedTipAmount.text = String(format:"$%.2f", tipAmount)
        totalWithTip.text = String(format:"$%.2f", total)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//formatting to make the calculate button have rounded edges
 calculateButton.layer.cornerRadius = calculateButton.frame.size.height/4

    }

}
