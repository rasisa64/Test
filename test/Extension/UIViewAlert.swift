//
//  UIViewAlert.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(withTitle title:String, message:String) {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
        })
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
