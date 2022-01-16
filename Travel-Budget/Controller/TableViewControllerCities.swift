//
//  TableViewControllerCities.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import UIKit
import FirebaseFirestore

class TableViewControllerCities: UITableViewController {
    
    var citys = [Cities]()
    var selctedId : String?
    var setSelctedId : String?
    
    var selctedCity: Cities?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelctedId = selctedId
        
        guard let setSelctedId = setSelctedId else { return }
        CitiysApi.getCitys(idCountry: setSelctedId) { citys in
            DispatchQueue.main.async {
                self.citys.append(citys)
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellCities
        
        guard let url = URL(string: citys[indexPath.row].imageCity ?? "" )else { return UITableViewCell() }
        
//        if let data = try? Data(contentsOf: url) {
//            cell.imageCities.image = UIImage(data: data)
//        }
        cell.imageCities.kf.setImage(with: url,options: [.cacheOriginalImage])
        
        cell.nameCities.text = citys[indexPath.row].name
        cell.layer.cornerRadius = 12
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selctedCity = citys[indexPath.row]
        performSegue(withIdentifier: "cell", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cell" {
            let vc = segue.destination as! PlacesAndInfoForcity
            vc.selctedCity = selctedCity
            vc.idCountries = setSelctedId
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.width
    }
}

