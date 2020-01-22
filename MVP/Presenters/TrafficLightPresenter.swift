//
//  TrafficLightPresenter.swift
//  MVP
//
//  Created by Luis Segoviano on 22/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    
    private let trafficLightService: TrafficLightService
    
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName: (String)) {
        trafficLightService.getTrafficLight(colorName: colorName) { (trafficLight) in
            if let trafficLight = trafficLight {
                trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.description)
            }
        }
    }
    
}
