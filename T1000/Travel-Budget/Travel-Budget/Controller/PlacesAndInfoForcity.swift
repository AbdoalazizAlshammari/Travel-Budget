//
//  DetailsForSelectedCity.swift
//  Travel-Budget
//
//  Created by Mac on 16/12/2021.


import UIKit
import FirebaseFirestore

class PlacesAndInfoForcity: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var places : Places?
    
    var selctedCity : Cities?
    var setSelctedCity : Cities?
    
    var idCountries:String?
    var setIdCountries : String?
    
    @IBOutlet weak var CollectionPlaces: UICollectionView!
    @IBOutlet weak var CityDescription: UILabel!
    @IBOutlet weak var imageDescription: UIImageView!
    @IBOutlet weak var textDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIdCountries = idCountries
        setSelctedCity = selctedCity
        CityDescription.text = setSelctedCity?.name
        
        guard let url = URL(string: setSelctedCity!.imageCity!) else { return }
        if let data = try? Data(contentsOf: url) {
            imageDescription.image = UIImage(data: data)
        }
        
        textDescription.text = setSelctedCity?.description
        PlacesApi.getPlaces(city: setSelctedCity!, idCountries: setIdCountries ?? " ", completion: { places in
            DispatchQueue.main.async {
                self.places = places
                self.CollectionPlaces.reloadData()
            }
        })
        CollectionPlaces.delegate = self
        CollectionPlaces.dataSource = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places?.names?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellco", for: indexPath) as! CollectionViewCell
        
        guard let url = URL(string: (places?.images?[indexPath.row])!) else { return UICollectionViewCell() }
        if let data = try? Data(contentsOf: url) {
            cell.imagesCollectionPlaces.image = UIImage(data: data)
        }

        cell.namesCollectionPlaces.text = places?.names?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> Int {
        
        //           selctedId = places[indexPath.row].id
//        performSegue(withIdentifier: "cell", sender: nil)
        
        //           print("tapped")
        return 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cell" {
            
            let vc = segue.destination as! CollectionViewCell
            // vc.selctedCity = selctedCity
        }
        
        
    }
//    func cityNames(){
//
//        var city = CityDescription.text
//        city?.append(Cities.getDataFromCities(dict: "").name ?? "")
//
//
//
//    }
//
//
}




