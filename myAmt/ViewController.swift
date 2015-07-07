//
//  ViewController.swift
//  myAmt
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var mentors = [Mentor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial location in Berlin
        let initialLocation = CLLocation(latitude: 52.5117, longitude: 13.3833)
        centerMapOnLocation(initialLocation)
        
        loadInitialData()
        mapView.addAnnotations(mentors)
        mapView.delegate = self
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadInitialData() {
        // 1
        let fileName = NSBundle.mainBundle().pathForResource("MentorList", ofType: "json");
        var readError : NSError?
        var data: NSData = NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(0), error: &readError)!
        
        // 2
        var error: NSError?
        let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions(0), error: &error)
        
        // 3
        if let jsonObject = jsonObject as? [String: AnyObject] where error == nil,
            // 4
            let jsonData = JSONValue.fromObject(jsonObject)?["mentorArray"]?.array {
                for mentorJSON in jsonData {
                    if let mentorObject = mentorJSON.object,
                        // 5
                        mentor = Mentor.fromJSON(mentorObject) {
                            mentors.append(mentor)
                    }
                }
        }
    }
    
    
}

