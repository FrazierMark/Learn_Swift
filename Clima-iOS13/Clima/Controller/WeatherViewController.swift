//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

// NOTES - The delegate is the one who is notified

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // basically says that textfield should report to our view controller
        // setting ViewController to the searchTextField delegate
        searchTextField.delegate = self
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    

    // Delegate functions are not called my "us"
    // They are triggered by the textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    
    // Text Field will re-prompt user to type something if they press "go" with nothing typed in
    
    // The textField class is the one responsible for calling this method
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else  {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    
    // Clears text field when done typing
    func textFieldDidEndEditing(_ textField: UITextField) {

        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        
        
        // Use searchTextField.text to get the weather for that city
        
        searchTextField.text = ""
    }


}

