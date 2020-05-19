//
//  ViewController.swift
//  Conversores 2
//
//  Created by William Tomaz on 20/04/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btnUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblResultUnit: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch titleUnit.text! {
            case "Temperatura":
                titleUnit.text = "Peso"
                btnUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                titleUnit.text = "Moeda"
                btnUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                titleUnit.text = "Distância"
                btnUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                titleUnit.text = "Temperatura"
                btnUnit1.setTitle("Celcius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btnUnit1{
                btUnit2.alpha = 0.5
            } else {
                btnUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch titleUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(lblResult.text!)!
        lblResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0{
            lblResultUnit.text = "Farenheint"
            lblResult.text = String (temperature * 1.8 + 32.0)
        }else {
            lblResultUnit.text = "Celcius"
            lblResult.text = String ((temperature - 32.0) / 1.8)
        }
    }
        
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0{
            lblResultUnit.text = "Libra"
            lblResult.text = String (weight / 2.2046)
        }else {
            lblResultUnit.text = "Kilograma"
            lblResult.text = String (weight * 2.2046)
        }
    }
        
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0{
            lblResultUnit.text = "Dólar"
            lblResult.text = String (currency / 5.30)
        }else {
            lblResultUnit.text = "Real"
            lblResult.text = String (currency * 5.30)
        }
    }
        
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btnUnit1.alpha == 1.0{
            lblResultUnit.text = "Kilômetros"
            lblResult.text = String (distance / 1000.0)
        }else {
            lblResultUnit.text = "Metros"
            lblResult.text = String (distance * 1000.0)
        }
    }
}
