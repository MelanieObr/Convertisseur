//
//  ViewController.swift
//  Convertisseur
//
//  Created by Mélanie Obringer on 14/06/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputValueType: UISegmentedControl!
    @IBOutlet weak var inputValueField: UITextField!
    @IBOutlet weak var outputMeter: UILabel!
    @IBOutlet weak var outputCentimeter: UILabel!
    @IBOutlet weak var outputInches: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getInputMeter() -> Double? {
        let inputMeter:Double?
        
        if let inputString:String = inputValueField.text,
            let inputDouble:Double = Double(inputString) {
            switch inputValueType.selectedSegmentIndex {
            case 0: //m
                inputMeter = inputDouble
            case 1: //cm
                inputMeter = UnitLength.centimeters.converter.baseUnitValue(fromValue: inputDouble)
            case 2: //inches
                inputMeter = UnitLength.inches.converter.baseUnitValue(fromValue: inputDouble)
            default:
                inputMeter = nil
            }
        } else {
            inputMeter = nil
        }
        return inputMeter
        
    }
    
    func convertValue()  {
        if let inputMeter = getInputMeter() {
            outputMeter.text = "\(inputMeter) m"
            outputCentimeter.text = "\(UnitLength.centimeters.converter.baseUnitValue(fromValue: inputMeter)) cm"
            outputInches.text = "\(UnitLength.inches.converter.baseUnitValue(fromValue: inputMeter)) cm"
        } else {
            outputMeter.text = nil
            outputCentimeter.text = nil
            outputInches.text = nil
        }
        
    }
    @IBAction func inputValueTypeChanged() {
        convertValue()
    }
    
    
    @IBAction func inputValueFieldChanged() {
        convertValue()
    }
}


