//
//  Alerts.swift
//  login
//
//  Created by Kiran Gutta on 17/01/24.
//

import UIKit
import Foundation

func sendAlert(on vc : UIViewController,title : String,message: String,actionTitle : String) {
    let uialert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    uialert.addAction(UIAlertAction(title: actionTitle, style: .cancel , handler: nil))
    DispatchQueue.main.async {
    vc.present(uialert, animated: true, completion: nil)
    }
}
