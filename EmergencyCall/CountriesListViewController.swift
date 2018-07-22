//
//  CountriesListViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredData = ["Name":"","Code":"","flag":""]
    
   
    var countryinfo:IsoCountryInfo!
    var issearching = false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if issearching {
            return 1
        }
        return IsoCountries.allCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = Bundle.main.loadNibNamed("CountryTableViewCell", owner: self, options: nil)?.first as! CountryTableViewCell
        if issearching{
            tempCell.CountryName.text = countryinfo.name
            tempCell.code.text = countryinfo.calling
            tempCell.imgView.text = countryinfo.flag
           
            return tempCell
        }
        tempCell.CountryName.text = IsoCountries.allCountries[indexPath.row].name
        tempCell.code.text = IsoCountries.allCountries[indexPath.row].calling
        tempCell.imgView.text = IsoCountries.flag(countryCode: IsoCountries.allCountries[indexPath.row].alpha2)
        return tempCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cell = tableView.cellForRow(at: indexPath) as! CountryTableViewCell
        print(cell.code.text!)
        Usercode = cell.code.text!
        flag = cell.imgView.text!
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
searchBar.delegate = self
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            issearching=false
            view.endEditing(true)
            tbView.reloadData()
        } else {
            countryinfo = IsoCountryCodes.searchByName(name: "\(searchBar.text!)")
            issearching = true
            
            tbView.reloadData()
            
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
