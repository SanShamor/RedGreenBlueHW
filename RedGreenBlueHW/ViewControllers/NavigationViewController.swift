//
//  NavigationViewController.swift
//  RedGreenBlueHW
//
//  Created by Александр on 10.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(color: UIColor)
}

class NavigationViewController: UIViewController {
    
    private var color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    
    private var redColorValue: Float = 0.50
    private var greenColorValue: Float = 0.50
    private var blueColorValue: Float = 0.50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bgColorView = segue.destination as? SettingsViewController else { return }
  
        bgColorView.colorSettingsVC = color
        bgColorView.delegate = self
    }
    
}
// MARK: - Extension
extension NavigationViewController: SettingsViewControllerDelegate {
    func setNewColor(color: UIColor) {
    self.color = color
        view.backgroundColor = color
    }
    
}
