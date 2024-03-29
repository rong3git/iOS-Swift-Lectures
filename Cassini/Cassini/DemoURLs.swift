//
//  DemoURLs.swift
//  Cassini
//
//  Created by rongc on 7/22/18.
//  Copyright © 2018 Rongchang Lei. All rights reserved.
//


import Foundation

struct DemoURLs
{
    static let stanford = Bundle.main.url(forResource: "oval", withExtension: "jpg")
    
    //    static let stanford = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "https://eoimages.gsfc.nasa.gov/images/imagerecords/79000/79803/earth_night_rotate.jpg",
            "Saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
