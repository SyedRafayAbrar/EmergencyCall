//
//  VerificationViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 18/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import FirebaseAuth

class VerificationViewController: UIViewController {

    @IBOutlet weak var txtfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func verifiedpressed(_ sender: Any) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verification_id,
            verificationCode: txtfield.text!)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print(error)
                
            } else {
                self.performSegue(withIdentifier: "toSignup", sender: nil)
                
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
