//: Playground - noun: a place where people can play

import UIKit
import MapKit

var str = "Hello world"

let coder = CLGeocoder()
var placemark:CLPlacemark?

coder.geocodeAddressString("甘肃省武威市民勤") { (placemarks, error) in
    if error != nil {
        print(error ?? "错误")
        
    }
    if let ps = placemarks{
        placemark = ps.first
    }

}

placemark?.location?.coordinate