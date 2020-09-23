//
//  ViewController.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 09/23/2020.
//  Copyright (c) 2020 Egor Iskrenkov. All rights reserved.
//

import UIKit
import HapticFeedback

class ViewController: UIViewController {

    @IBOutlet weak var hapticEventButton: UIButton!
    @IBOutlet weak var codeTriggerButton: UIButton!
    @IBOutlet weak var hapticFeedbackSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHapticEventButton()
        setupHapticFeedbackSwitch()
    }

    private func setupHapticEventButton() {
        self.hapticEventButton.setFeedback(type: .impact(.heavy))
    }

    private func setupHapticFeedbackSwitch() {
        self.hapticFeedbackSwitch.isOn = UserDefaults.standard.bool(forKey: "haptic_enabled")
    }

    @IBAction func triggerHapticFeedback(_ sender: Any) {
        HapticGenerator.perform(.notification(.error))
    }

    @IBAction func switchHapticFedback(_ sender: UISwitch) {
        HapticGenerator.enabled = sender.isOn
        UserDefaults.standard.set(sender.isOn, forKey: "haptic_enabled")
    }

}

