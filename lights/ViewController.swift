//
//  ViewController.swift
//  lights
//
//  Created by Екатерина Чернова on 16.10.2020.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}
// `енум для реализации смены цветов

class ViewController: UIViewController {
    
    @IBOutlet var redLights: UIView!
    @IBOutlet var yellowLights: UIView!
    @IBOutlet var greenLights: UIView!
    
    @IBOutlet var startButton: UIButton!
   // обьявляем аутлеты
    
    // далее обявляем свойства, они должны быть приватными
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.layer.cornerRadius = 10
        
        redLights.alpha = lightIsOff
        yellowLights.alpha = lightIsOff
        greenLights.alpha = lightIsOff
    }

    override func viewWillLayoutSubviews() {
        redLights.layer.cornerRadius = redLights.frame.width / 2
        yellowLights.layer.cornerRadius = redLights.frame.width / 2
        greenLights.layer.cornerRadius = redLights.frame.width / 2
    }
    
    @IBAction func startButtonPressed () {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        
        case .red:
            greenLights.alpha = lightIsOff
            redLights.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLights.alpha = lightIsOff
            yellowLights.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLights.alpha = lightIsOn
            yellowLights.alpha = lightIsOff
            currentLight = .red
        }
    }
}

