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
    var filteredData = [String]()
    var issearching = false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if issearching {
            return filteredData.count
        }
        return IsoCountries.allCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = Bundle.main.loadNibNamed("CountryTableViewCell", owner: self, options: nil)?.first as! CountryTableViewCell
        if issearching{
            tempCell.CountryName.text = filteredData[indexPath.row]
            tempCell.code.text = filteredData[indexPath.row]
            tempCell.imgView.text = filteredData[indexPath.row]
        }
        tempCell.CountryName.text = IsoCountries.allCountries[indexPath.row].name
        tempCell.code.text = IsoCountries.allCountries[indexPath.row].calling
        tempCell.imgView.text = IsoCountries.flag(countryCode: IsoCountries.allCountries[indexPath.row].alpha2)
        return tempCell
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
            issearching = true
            
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
