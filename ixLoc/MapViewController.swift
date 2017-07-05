//
//  ViewController.swift
//  ixLoc
//
//  Created by super Tony on 7/4/17.
//  Copyright © 2017 superTony. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, AddActivityDelegate {
   
    @IBOutlet weak var map: MKMapView!
    var activity: Activity?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.activity = Activity(name:"Tony",description:"Home",latitude:39.9689,longitude:116.3320)
        
        let coordinate = CLLocationCoordinate2D(latitude: (activity?.latitude!)!, longitude: (activity?.longitude!)!)
        
        
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        point.title = self.activity?.name
        
        map.addAnnotation(point)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToAddActivity"{
            let addActivityNavigationController = segue.destination as! UINavigationController
            let addActivityViewController = addActivityNavigationController.topViewController as! AddActivityViewController
            addActivityViewController.delegate = self
    }
        
        
    
        
    }
    func didAddActivity(activity:Activity){
        let coordinate = CLLocationCoordinate2D(latitude: activity.latitude!, longitude: activity.longitude!)
        
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        point.title = activity.name
        
        map.addAnnotation(point)
    }
    
    func defaultName() -> String?{
        return "DamnBro"
    }
    
    func locationManager (_manager: CLLocation,didUpdateLocations locations: [CLLocation]){
        
    }
    
    


}

