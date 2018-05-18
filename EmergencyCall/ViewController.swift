//
//  ViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var continueWith: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueWith.layer.masksToBounds = true
        continueWith.layer.cornerRadius = 4
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }

}

