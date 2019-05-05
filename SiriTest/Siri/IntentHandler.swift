//
//  IntentHandler.swift
//  Siri
//
//  Created by Raju on 31/03/19.
//  Copyright © 2019 Raju. All rights reserved.
//

import Intents
import HelperSiri

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        if  intent is BabyIntent {
            return CoolFunClass()
        }
        
        return self
    }
    
}
