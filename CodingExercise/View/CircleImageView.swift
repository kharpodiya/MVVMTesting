//
//  CircleImageView.swift
//  CodingExercise
//
//  Created by mav on 31/03/21.
//  Copyright © 2021 Rise Buildings. All rights reserved.
//

import UIKit

/*
 Circular image view
 */

//@IBDesignable
class CircleImageView: UIImageView {

    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height/2

    }

}
