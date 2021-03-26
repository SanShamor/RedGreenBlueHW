//
//  ViewController.swift
//  RedGreenBlueHW
//
//  Created by Александр on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var buttonVision: UIButton!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonVision.isHidden = true
        redValueLabel.isHidden = true
        greenValueLabel.isHidden = true
        blueValueLabel.isHidden = true
        
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
        
        viewColor.layer.cornerRadius = 45
        viewColor.layer.borderColor = UIColor.black.cgColor
        viewColor.layer.borderWidth = 2
    }

    @IBAction func slidersValue(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func buttonPressedClear(_ sender: UIButton) {
        viewColor.backgroundColor = UIColor.clear
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
    }
    
    private func updateColor() {
        buttonVision.isHidden = false
        redValueLabel.isHidden = false
        greenValueLabel.isHidden = false
        blueValueLabel.isHidden = false
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        red = CGFloat(redSlider.value)
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        green = CGFloat(greenSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blue = CGFloat(blueSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        viewColor.backgroundColor = color
}

}
