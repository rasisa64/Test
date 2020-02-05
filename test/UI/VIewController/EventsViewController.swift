//
//  EventsViewController.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import MessageUI
import AlamofireImage

class EventsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = emailTextField.text
            , let password = passwordTextField.text
            , user.isEmpty == false
            , password.isEmpty == false else {
                showAlert(withTitle: "Error", message: "Debe ingresar un usuario y password")
                return
        }
        
        let service = UserRepository()
        service.login(user: user, password: password) { (result) in
            switch result {
            case .failure(let error):
                self.showAlert(withTitle: "Error", message: error.localizedDescription)
                
            case .success(let userJSON):
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                appDelegate?.changeWindowToApp()
            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
