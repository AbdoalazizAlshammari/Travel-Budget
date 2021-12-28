//
//  ViewControllerBookings.swift
//  Travel-Budget
//
//  Created by Mac on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import SwiftUI

class CountriesVC:
    UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    var countries = [Countries]()
    var selctedId : String?
    var casees :Int?
    
 //   var selctedcase : Countries?
//    var setselctedcase : Countries?
    
    @IBOutlet weak var CollectionCountries: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        CountriesApi.duplicateCountries()
        
        CountriesApi.getCountries { countries in
            DispatchQueue.main.async {
               
                if self.casees == countries.selctedCase {
                    self.countries.append(countries)
                    self.CollectionCountries.reloadData()
                }
             
               
            }
        }
        
        CollectionCountries.dataSource = self
        CollectionCountries.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountriesCell", for: indexPath) as! CollectionViewCellCountries
        
        guard let url = URL(string: countries[indexPath.row].imageCountry ?? "") else { return UICollectionViewCell() }
        
        if let data = try? Data(contentsOf: url) {
            cell.countryImage.image = UIImage(data: data)
        }
        cell.countryName.text = countries[indexPath.row].nameCountry
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selctedId = countries[indexPath.row].id//[0].name
        print(selctedId)
        performSegue(withIdentifier: "ToCities", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //    if segue.identifier == "ToCities" {
        let vc = segue.destination as! TableViewControllerCities
        vc.selctedId = selctedId
    }
    //}
    func CollectionView(_ CollectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 180)
    }
}



