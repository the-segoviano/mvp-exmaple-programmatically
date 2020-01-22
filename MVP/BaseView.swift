//
//  BaseView.swift
//  MVP
//
//  Created by Luis Segoviano on 22/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(" Error to nitialize ")
    }
    
}
