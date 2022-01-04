//
//  ViewController.swift
//  RedGreenBlueHW
//
//  Created by Александр on 26.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK: - Public Properties & viewDidLoad
    var colorSettingsVC: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 45
        viewColor.backgroundColor = colorSettingsVC
        updateValuesByProperties()

    }
    
    // MARK: - IB Actions
    @IBAction func slidersValue(_ sender: UISlider) {
        updateColorBySliders()
    }
    
    @IBAction func textFieldValue(_ sender: UITextField) {
        updateColorByTextFields()
    }
    
    @IBAction func DoneButtonPressed() {
        view.endEditing(true)
        delegate.setNewColor(color: (viewColor.backgroundColor ?? view.backgroundColor)!)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func updateColorBySliders() {
        
        let red = CGFloat(redSlider.value)
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        
        let green = CGFloat(greenSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        
        let blue = CGFloat(blueSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        viewColor.backgroundColor = color
    }
    
    private func updateColorByTextFields() {
        redSlider.value = Float(redTextField.text!) ?? 0
        greenSlider.value = Float(greenTextField.text!) ?? 0
        blueSlider.value = Float(blueTextField.text!) ?? 0
        
        updateColorBySliders()
    }
    private func updateValuesByProperties() {
        setSliders()
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        redSlider.value = redSlider.value
        
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        greenSlider.value = greenSlider.value
        
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        blueSlider.value = blueSlider.value
    }
    private func setSliders() {
        let ciColor = CIColor(color: colorSettingsVC)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
}
    // MARK: - Extension
    extension SettingsViewController: UITextFieldDelegate {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == redTextField {
                greenTextField.becomeFirstResponder()
            } else if textField == greenTextField {
                blueTextField.becomeFirstResponder()
            } else {
                updateColorByTextFields()
            }
            return true
        }
    }

