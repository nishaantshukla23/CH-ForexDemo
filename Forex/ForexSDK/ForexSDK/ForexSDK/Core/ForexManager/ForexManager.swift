//
//  ForexManager.swift
//  ForexSDK
//
//  Created by N Shukla on 13/02/23.
//

import Foundation


public final class ForexManager {
    
    // MARK: Public Interface
    public static let shared = MAuthManager()
    //temporary function
    func testSDKAcces() {
        let alert = UIAlertController(title: "Hello, I am ForexSDK", message: "you got the access.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
