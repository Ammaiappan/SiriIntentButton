//
//  ViewController.swift
//  SiriTest
//
//  Created by Raju on 31/03/19.
//  Copyright © 2019 Raju. All rights reserved.
//

import UIKit
import IntentsUI
import Intents
import HelperSiri

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSiriButton(intent: intent1, to: view1)
        addSiriButton(intent: intent2, to: view2)
    }
    
    func addSiriButton(intent: INIntent, to view: UIView) {
        
        /*
        INVoiceShortcutCenter.shared.getAllVoiceShortcuts { (allVoiceShortcuts, error) in
            
            if let allVoiceShortcuts = allVoiceShortcuts {
                for allVoiceShortcut in allVoiceShortcuts {
                    print(allVoiceShortcut);
                }
            }
        }*/
        let button = INUIAddVoiceShortcutButton(style: .whiteOutline)
        
        button.shortcut = INShortcut(intent: intent )
        button.delegate = self
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
    }
    
    public var intent1: BabyIntent {
        let testIntent = BabyIntent()
        testIntent.suggestedInvocationPhrase = "Cool baby"
        return testIntent
    }

    
    public var intent2: CoolBabyIntent {
        let testIntent = CoolBabyIntent()
        testIntent.suggestedInvocationPhrase = "Cool baby cool"
        return testIntent
    }

}

extension ViewController: INUIAddVoiceShortcutButtonDelegate {
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ViewController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
