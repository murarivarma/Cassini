//
//  DemoURL.swift
//  Cassini
//
//  Created by Murari Varma on 26/11/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

import Foundation
struct DemoURL
{
    static let mail = URL(string: "https://www.microsoft.com/en-in/outlook-com/img/mobile-carousel/SendAvailabilty_default.jpg")
    static let microsoft_cms = URL(string: "https://c.s-microsoft.com/en-in/CMSImages/Windows_Features_Overview_1920_FeatureImagePriority_3Dcreations_IMG.jpg?version=7c2aaec5-9fc0-b2f0-23d1-f0223ac68102")
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
