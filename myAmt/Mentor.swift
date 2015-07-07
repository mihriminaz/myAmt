//
//  Mentor.swift
//  myAmt
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import Foundation
import MapKit
import AddressBook

class Mentor: NSObject, MKAnnotation {
    let title: String
    let motto: String
    let hashtags: String
    let profilePoint: String
    let availableNow: Bool
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, motto: String, hashtags: String, profilePoint: String, availableNow: Bool, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.motto = motto
        self.hashtags = hashtags
        self.profilePoint = profilePoint
        self.availableNow = availableNow
        self.coordinate = coordinate
        
        super.init()
    }
    
    class func fromJSON(json: [String:JSONValue]) -> Mentor? {
        // 1
        let title = json["nickname"]?.string
        let motto = json["motto"]?.string
        let hashtags = json["hashtags"]?.string
        let profilePoint = json["profilePoint"]?.string
        let coordinateObject : [String:JSONValue] = json["coordinate"]!.object!
        let latitude = coordinateObject["latitude"]?.double
        let longitude = coordinateObject["longitude"]?.double
        let coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let availableNow = json["availableNow"]?.bool
        
        // 3
        return Mentor(title: title!, motto: motto!, hashtags: hashtags!, profilePoint: profilePoint!, availableNow: availableNow!, coordinate: coordinate)
    }
    
    var subtitle: String {
        return title
    }
    
    // MARK: - MapKit related methods
    
    // pinColor for disciplines: Sculpture, Plaque, Mural, Monument, other
    func pinColor() -> MKPinAnnotationColor  {
        if availableNow {
            return .Green
        }
        else {
            return .Red
        }
    }
    
    // annotation callout opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [String(kABPersonAddressStreetKey): self.subtitle]
        let placemark = MKPlacemark(coordinate: self.coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.title
        
        return mapItem
    }
    
}
