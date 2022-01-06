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
    
    var timer : Timer?

    
    @IBOutlet weak var CollectionPlaces: UICollectionView!
    @IBOutlet weak var CityDescription: UILabel!
    @IBOutlet weak var imageDescription: UIImageView!
    @IBOutlet weak var textDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(anim), userInfo: nil, repeats: true)
        
        
        
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
        return places?.images?.count ?? 0
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
        if segue.identifier == "goWeather" {
            
            let vc = segue.destination as! WeatherVC
            vc.lon  = setSelctedCity?.lon ?? 0.0
            vc.lat = setSelctedCity?.lat ?? 0.0
        }
        
        
    }
    @objc func anim (){
    
        let lastItem = CollectionPlaces.indexPathsForVisibleItems.last
        let currentItem = IndexPath(item: lastItem!.item, section: 0)
        CollectionPlaces.scrollToItem(at: currentItem, at: .right, animated: true)
        var nextItem = currentItem.item + 1
        
        if nextItem == places?.images?.count
        {
            
            nextItem = 0
        }
        let nextIndexPath = IndexPath(item: nextItem, section: 0)
        CollectionPlaces.scrollToItem(at: nextIndexPath, at: .right, animated: true)
    }
    

    @IBAction func goToWeather(_ sender: Any) {
        performSegue(withIdentifier: "goWeather", sender: nil)
    }
}




