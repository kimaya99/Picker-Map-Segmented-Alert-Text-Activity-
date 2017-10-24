//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/18/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    let initialLocation = CLLocation(latitude: 32.7157, longitude: -117.1611)
    let regionRadius: CLLocationDistance = 25000
    let locationManager = CLLocationManager()
    
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 3.0, regionRadius * 3.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsPointsOfInterest = true
        mapView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        centerMapOnLocation(location: initialLocation)
        let coordinates = CLLocationCoordinate2D(latitude: 32.6848, longitude: -117.1878)
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.stopUpdatingLocation()
            
        }
        
        let sourceCoordinates = locationManager.location?.coordinate
        let destCoordinates = CLLocationCoordinate2DMake(32.6848, -117.1878)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates!)
        let destPlacemark = MKPlacemark(coordinate: destCoordinates)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark : destPlacemark)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: { (response, error) in
            guard let response = response else{
                if error != nil{
                    print("something went wrong")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapView.add(route.polyline,level:.aboveRoads)

            })
        
        
        
        let annotation = MKPointAnnotation()
        annotation.title = "Coronado"
        annotation.subtitle = "Place"
        annotation.coordinate = coordinates
        
        mapView.addAnnotation(annotation)
        
        let uilongpgr = UILongPressGestureRecognizer(target: self, action: #selector(SecondViewController.longpress(gestureRecognizer:)))
        uilongpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilongpgr)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5
        return renderer
    }
    
   @objc func longpress(gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint,toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

