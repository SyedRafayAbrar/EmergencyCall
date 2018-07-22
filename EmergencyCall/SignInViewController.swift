//
//  SignInViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth

class SignInViewController: UIViewController,CLLocationManagerDelegate{
    var usercode:String!
    var userflag:String!
    
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var txtArer: UITextField!
    @IBOutlet weak var img: UILabel!
    var locationmanager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
        
       
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print(Usercode)
 codeLbl.text = Usercode
img.text = flag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuepressed(_ sender: Any) {
        if  txtArer.text == "" || txtArer.text == nil || txtArer.text?.count != 10 {
            let alert = UIAlertController(title: "Error", message: "Please Enter a Correct Number to continue", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Verification", message: "Please Verify a Number", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            let next = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) in
                let phoneNum = "\(self.codeLbl.text!)"+"\(self.txtArer.text!)"
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNum, uiDelegate: nil) { (verificationID, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    } else {
                        mobnum = phoneNum
                        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                        verification_id = UserDefaults.standard.string(forKey: "authVerificationID")
                        self.performSegue(withIdentifier: "toVerify", sender: nil)
                    }
                    // Sign in using the verificationID and the code sent to the user
                    // ...
                }
                
            }
            alert.addAction(cancel)
            alert.addAction(next)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                print(placemarks?[0])
                if let placemark = placemarks?[0] {
                    if placemark.country != nil {
                        
                        Usercountry = placemark.country!
                        let uc = IsoCountryCodes.searchByName(name: Usercountry)
                        Usercode = uc.calling
                        flag = uc.flag
                        self.codeLbl.text = "\(Usercode!)"
                        self.img.text = flag

                        print(Usercountry)
                      self.locationmanager.stopUpdatingLocation()
                    };
                }
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
