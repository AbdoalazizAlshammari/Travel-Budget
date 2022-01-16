//
//  TableViewControllerFavorite.swift
//  Travel-Budget
//
//  Created by Mac on 05/01/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Kingfisher
class TableViewControllerFavorite: UITableViewController {
    var favarites = [FavoriteApi]()
    var countries = [Countries]()
    var selectedId : String?
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
//     deleteDocument()
//        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { countries in
       
            
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countries.removeAll()
        FavoriteApi.getFavorite(uid: Auth.auth().currentUser?.uid ?? "") { countries in
            DispatchQueue.main.async {
                self.countries.append(countries)
                self.tableView.reloadData()
            }
        }
    }
        
        
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GotoFav", for: indexPath) as! TableViewCellFavorite

        guard let url = URL(string: countries[indexPath.row].imageCountry ?? "") else {return UITableViewCell() }

        cell.countryTitle.text = countries[indexPath.row].nameCountry
        
        cell.countryImage.kf.setImage(with: url, options: [.cacheOriginalImage])
        cell.layer.cornerRadius = 12
     return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
                      // Any action when you cancel
                 
       
      selectedId = countries[indexPath.row].id
        performSegue(withIdentifier: "GoDetail", sender: nil)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TableViewControllerCities
        vc.selctedId = selectedId
    }
    @IBAction func deleteFav(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delated")
            let country = self.countries.remove(at: indexPath.row)

            FavoriteApi.deleteDocument(uid: Auth.auth().currentUser?.uid ?? "0", favorite: country.id ?? "")

            self.tableView.reloadData()

        }
    }
}

