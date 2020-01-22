//
//  TrafficLightService.swift
//  MVP
//
//  Created by Luis Segoviano on 22/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    func getTrafficLight(colorName:(String), callBack:(TrafficLight?) -> Void) {
        let trafficLights = [TrafficLight(colorName: "Red", description: "Stop"),
                             TrafficLight(colorName: "Green", description: "Go"),
                             TrafficLight(colorName: "Yellow", description: "About to change to red")
        ]
        
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName}) {
            callBack(foundTrafficLight)
        } else {
            callBack(nil)
        }
    }
    
}
