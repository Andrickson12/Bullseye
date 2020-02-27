//
//  ViewController.swift
//  Bullseye
//
//  Created by Andrickson Coste on 2/26/20.
//  Copyright © 2020 Qalab Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Button Outlets
    @IBOutlet weak var hitMePressed: UIButton!
    @IBOutlet weak var startOverPressed: UIButton!
    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var roundLbl: UILabel!
    
    //Properties
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes buttons rounded
        hitMePressed.layer.cornerRadius = 8
        startOverPressed.layer.cornerRadius = 8
        random()
        roundLbl.text = String(index)
    }
    
    
    //Hit me Button
    @IBAction func hitMeAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Points: \(String(format: "%.0f", sliderOutlet.value))", message: "This is your score based on your precision.", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.alerta()}))
        
        self.present(alert, animated: true)
        
    }
    
    //Start over button
    @IBAction func startOverAction(_ sender: UIButton) {
        startOver()
    }
    
    func alerta() -> String{
        
        //Put slider value inside valor constant and round it to 0 places.
        let valor = String(format: "%.0f", sliderOutlet.value)
        scoreLbl.text = valor
        
        //Randomize the number
        random()
        
        //Checking to see if roundLbl is 10 if its 10 go back to one.
        if index != 10{
        index += 1
        }
        else{
            startOver()
        }
        
        //Putting and coverting index as a String inside the round label
        roundLbl.text = String(index)
        
        //Return value
        return valor
        
    }
    
    //Function to reset all label
    func startOver(){
        scoreLbl.text = "0"
        index = 1
        random()
    }
    
    //Function to randomize the number label
    func random(){
        let number = String(Int.random(in: 1 ..< 100))
        randomNumber.text = number
    }
}

