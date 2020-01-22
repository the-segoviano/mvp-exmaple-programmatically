//
//  TrafficLightViewController.swift
//  MVP
//
//  Created by Luis Segoviano on 22/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {
    
    var redLightView: BaseView!
    var yellowLightView: BaseView!
    var greenLightView: BaseView!
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        redLightView = BaseView()
        redLightView.backgroundColor = .red
        redLightView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.redLightAction)))
        yellowLightView = BaseView()
        yellowLightView.backgroundColor = .yellow
        yellowLightView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(self.yellowLightAction)))
        greenLightView = BaseView()
        greenLightView.backgroundColor = .green
        greenLightView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(self.greenLightAction)))
        
        setUpView()
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    func setUpView() {
        view.addSubview(redLightView)
        view.addSubview(yellowLightView)
        view.addSubview(greenLightView)
        redLightView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redLightView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        redLightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redLightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        yellowLightView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowLightView.topAnchor.constraint(equalTo: redLightView.bottomAnchor, constant: 20).isActive = true
        yellowLightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        yellowLightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        greenLightView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenLightView.topAnchor.constraint(equalTo: yellowLightView.bottomAnchor, constant: 20).isActive = true
        greenLightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greenLightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func redLightAction() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
    }
    
    @objc func yellowLightAction() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
    }
    
    @objc func greenLightAction() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
    }
    
}

extension TrafficLightViewController: TrafficLightViewDelegate {
    
    func displayTrafficLight(description: (String)) {
        print(description)
    }
    
}


protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description:(String))
}

