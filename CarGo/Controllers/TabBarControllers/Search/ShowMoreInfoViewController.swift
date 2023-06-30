//
//  ShowMoreInfoViewController.swift
//  CarGo
//
//  Created by user on 3/9/23.
//

import UIKit
import MapKit

class ShowMoreInfoViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet public weak var showMoreInfoLabel: UILabel!
    @IBOutlet weak var startCityName: UILabel!
    @IBOutlet weak var endCityName: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var index = 0
    var array: Any = ""
    var model = CarGOData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        drawRoad()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = .red
        render.lineWidth = 4
        render.canDraw(.null, zoomScale: 2)
        return render
    }
    
   
    
    func drawRoad(){
        
        showMoreInfoLabel.text = model.moreInfo
        startCityName.text = model.initialCity
        endCityName.text = model.finalCity
        priceLabel.text = "\(model.price) $"
        
        let sourceLocation = CLLocationCoordinate2D(latitude: model.startCityCoordinate.lat, longitude: model.startCityCoordinate.long)
        let destinationLocation = CLLocationCoordinate2D(latitude: model.finalCityCoordinate.lat, longitude: model.finalCityCoordinate.long)
        

            mapView.delegate = self
            
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = model.initialCity

            if let location = sourcePlacemark.location {
              sourceAnnotation.coordinate = location.coordinate
            }


        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = model.finalCity

            if let location = destinationPlacemark.location {
              destinationAnnotation.coordinate = location.coordinate
            }

           
            self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

            
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .any
        

            
        let directions = MKDirections(request: directionRequest)

            
        directions.calculate {
              (response, error) -> Void in

              guard let response = response else {
                if let error = error {
                  print("Error: \(error)")
                }

                return
              }
        

              let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let distance = Int(route.distance/1000)
            self.distanceLabel.text = "\(String(distance)) Km"

              let rect = route.polyline.boundingMapRect
            //self.mapView.setRegion(MKCoordinateRegion(rect), animated: false)
            
          }
            
        
        
    }
    
}

class CustomPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(location: CLLocationCoordinate2D, pinTitle: String, pinSubTitle: String) {
        
        self.coordinate = location
        self.title = pinTitle
        self.subtitle = pinSubTitle
        
    }
    
}
