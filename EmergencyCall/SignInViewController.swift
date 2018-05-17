//
//  SignInViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController,UITableViewDelegate {
var countries: [String] = []
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var txtArer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
         cName()
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension SignInViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
 
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let tempCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        tempCell.textLabel?.text! = countries[indexPath.row]
        
        return tempCell
        
    }
    
    
}

extension SignInViewController{
    func cName() {
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        
        print(countries)
    }
}
