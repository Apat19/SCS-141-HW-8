//
//  ViewController.swift
//  SCS 141 HW 6
//
//  Created by Austin Patton on 4/25/23.
//

import UIKit
import CoreLocation
import WebKit

class ViewController: UIViewController, CLLocationManagerDelegate {
   
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var smokyMountains: UIImageView!
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // Smoky mountain coordinates
    let smokyMountainLatitude = 35.6532
    let smokyMountainLongitude = -83.5070

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation] ){
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        //horizontal accuracy less then 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0{
            let smokyMountains:CLLocation = CLLocation(latitude: smokyMountainLatitude, longitude: smokyMountainLongitude)
            let delta:CLLocationDistance = smokyMountains.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5 //meters to rounded miles
            if miles < 3 {
                // stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy \nThe Smoky Mountains"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))! + " miles to the Smoky Mountains"
            }
        }
    }
    
    
    

    


    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
        
    }


}

