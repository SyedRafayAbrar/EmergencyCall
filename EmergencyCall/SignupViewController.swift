//
//  SignupViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 18/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SwiftKeychainWrapper

class SignupViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var gender = ["male","female"]
    var ref: DatabaseReference!
    var selected_gender:String!
    var user = ["FName":"","LName":"","email":"","DatofBirth":"","gender":""]
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var dateofBirth: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected_gender = gender[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signup.layer.masksToBounds = true
        signup.layer.cornerRadius = 4        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        if firstName.text! == "" || lastName.text! == "" || Email.text! == "" || dateofBirth.text! == "" || selected_gender == "" {
    let alert = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        } else {
            ref = Database.database().reference()
            user["FName"]=firstName.text!
            user["LName"]=lastName.text!
            user["DateofBirth"]=dateofBirth.text!
            user["email"]=Email.text!
            user["gender"]=selected_gender
            self.ref.child("users").child(mobnum).setValue(user)
            let keychainResult = KeychainWrapper.standard.set(mobnum, forKey: KEY_UID)
            performSegue(withIdentifier: "toMap", sender: nil)
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
