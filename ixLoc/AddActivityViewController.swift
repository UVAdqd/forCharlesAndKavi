//
//  AddActivityViewController.swift
//  ixLoc
//
//  Created by super Tony on 7/4/17.
//  Copyright © 2017 superTony. All rights reserved.
//

import UIKit
import MapKit

class AddActivityViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    var activityTableViewController: ActivityTableViewController?
    var delegate:AddActivityDelegate?
    var latestLocation:CLLocation?
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultname = delegate?.defaultName()
        nameTextField.text = defaultname
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        
        var activity:Activity
        if let location = self.latestLocation{
            activity = Activity(name:nameTextField.text,description:descriptionTextField.text,latitude:location.coordinate.latitude,longitude:location.coordinate.longitude)
        } else{
        activity = Activity(name: nameTextField.text,description:descriptionTextField.text)
        }
        delegate?.didAddActivity(activity: activity)
        //activityTableViewController?.activities.append(activity)
        //activityTableViewController?.tableView?.reloadData()
        self.dismiss(animated:true, completion: nil)
        
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations[0].coordinate.latitude)
        self.latestLocation = locations[0]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
