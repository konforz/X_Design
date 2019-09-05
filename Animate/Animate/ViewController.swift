//
//  ViewController.swift
//  Animate
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var anchorPoint : (Double,Double)
        let shapeLayer = CAShapeLayer()
        var linePath = UIBezierPath()
        
        
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shapeLayer.borderWidth = 2.0
        anchorPoint.self = (0.5,0.5)
        linePath.addLine(to: CGPoint(x: 120, y: 120.0))
        
        linePath.move(to: .zero)
        linePath.addLine(to: CGPoint(x: 0.0, y: 120.0))
        linePath.addLine(to: CGPoint(x: 120.0, y: 120.0))
        linePath.addLine(to: CGPoint(x: 120.0, y: 0.0))
        
        

}
}
