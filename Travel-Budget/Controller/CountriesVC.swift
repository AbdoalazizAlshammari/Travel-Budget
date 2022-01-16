//
//  ViewControllerBookings.swift
//  Travel-Budget
//
//  Created by Mac on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import Kingfisher



class CountriesVC:
    UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var countries = [Countries]()
    var selctedId : String?
    var casees :Int?
    
    
    @IBOutlet weak var collectionCountries: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        CountriesApi.duplicateCountries()
        
        CountriesApi.getCountries { countries in
            DispatchQueue.main.async {
               
                if self.casees == countries.selctedCase {
                    self.countries.append(countries)
                    self.collectionCountries.reloadData()
                }
             
               
            }
        }
        
        collectionCountries.dataSource = self
        collectionCountries.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountriesCell", for: indexPath) as! CollectionViewCellCountries
        
        guard let url = URL(string: countries[indexPath.row].imageCountry ?? "") else { return UICollectionViewCell() }
       
        cell.countryImage.kf.setImage(with: url, options: [.cacheOriginalImage])
        
        cell.countryName.text = countries[indexPath.row].nameCountry
        cell.parentController = self
        
        cell.favrite = countries[indexPath.row].id ?? ""
        cell.layer.cornerRadius = 6
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selctedId = countries[indexPath.row].id
 
        performSegue(withIdentifier: "ToCities", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //    if segue.identifier == "ToCities" {
        let vc = segue.destination as! TableViewControllerCities
        vc.selctedId = selctedId
    }

    func collectionView(_ CollectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400

    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 240)
    }
}



