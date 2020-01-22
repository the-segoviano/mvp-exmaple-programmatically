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
    
    var descriptionLabel: UILabel!
    
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
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: descriptionLabel.font.pointSize)
        
        setUpView()
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    func setUpView() {
        view.addSubview(redLightView)
        view.addSubview(yellowLightView)
        view.addSubview(greenLightView)
        view.addSubview(descriptionLabel)
        
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
        descriptionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: greenLightView.bottomAnchor, constant: 40).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25.0).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.0).isActive = true
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
        descriptionLabel.text = description
    }
    
}


protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description:(String))
}

