//
//  MapViewController.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 18/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces
import GoogleMaps
import Alamofire
import SwiftyJSON
class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    @IBOutlet weak var mapview: GMSMapView!
    var location:CLLocation!
    var locationTujuan:CLLocation!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
        mapview.isMyLocationEnabled = true
        mapview.settings.myLocationButton = true
        mapview.settings.compassButton = true
        
        mapview.delegate = self
       
//        self.view = mapview
      
        // Do any additional setup after loading the view.
    }

    
    func createMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.title = titleMarker
        marker.icon = iconMarker
        marker.map = mapview
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
       location = locations.last
        
        //        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        locationTujuan = CLLocation(latitude: 37.333897, longitude: -122.035635)
        
        createMarker(titleMarker: "Lokasi Tujuan", iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: locationTujuan.coordinate.latitude, longitude: locationTujuan.coordinate.longitude)
        
        createMarker(titleMarker: "Lokasi Aku", iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
       
        
        //        self.googleMaps?.animate(to: camera)
        locationmanager.stopUpdatingLocation()
//                let location = locations.last
//
//        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 10.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        self.mapview = mapView
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.icon = #imageLiteral(resourceName: "logo-1")
//        marker.position = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
////        marker.position = CLLocationCoordinate2D(latitude: 35.33233141, longitude: -152.0312186)
//        marker.map = mapView
//locationmanager.stopUpdatingLocation()
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func drawPath(startLocation: CLLocation, endLocation: CLLocation)
    {
        let origin = "\(startLocation.coordinate.latitude),\(startLocation.coordinate.longitude)"
        let destination = "\(endLocation.coordinate.latitude),\(endLocation.coordinate.longitude)"
        
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        
        Alamofire.request(url).responseJSON { response in
            
            print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result as Any)   // result of response serialization
            
            let json = try! JSON(data: response.data!)
            let routes = json["routes"].arrayValue
            
            // print route using Polyline
            for route in routes
            {
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath: points!)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeWidth = 4
                polyline.strokeColor = UIColor.red
                polyline.map = self.mapview
            }
            
        }
    }
    
    @IBAction func emergencyPressed(_ sender: Any) {
        print(locationTujuan!)
         drawPath(startLocation: location, endLocation: locationTujuan)
    }
    

}
