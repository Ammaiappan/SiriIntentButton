//
//  CoolFunClass.swift
//  SiriTest
//
//  Created by Raju on 31/03/19.
//  Copyright © 2019 Raju. All rights reserved.
//

import UIKit
import HelperSiri

class CoolFunClass: NSObject {

}

extension CoolFunClass: BabyIntentHandling {
    func handle(intent: BabyIntent, completion: @escaping (BabyIntentResponse) -> Void) {
        let coo = SiriHelperClass().babyName()
        
        let res = BabyIntentResponse(code: .success, userActivity: nil)
        
        res.name = coo
        
        completion(res)
    }
    
    
}
