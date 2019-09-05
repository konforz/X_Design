//
//  ViewController.swift
//  Jesture
//
//  Created by MCS on 9/3/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var movingLabel: UILabel!
    private var initialPoint: CGPoint!
    var tap: Bool = true
    let gestureRecognizer = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPanGesture()
        addRotationGesture()
        addPinch()
        addTappedTwice()
        
    }
    func addnameChange() {
        self.movingLabel.text = "the Label was Double Tapped"
        self.movingLabel.textColor = UIColor.red
    }
    
    func labelName() {
        self.movingLabel.text = "movers"
        self.movingLabel.textColor = UIColor.black
    }
    func addPinch() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer()
        pinchGestureRecognizer.addTarget(self, action: #selector(pinchTheLabel(sender:)))
        movingLabel.addGestureRecognizer(pinchGestureRecognizer)
        
    }
    
    func addTappedTwice() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(tapTheLabel(sender:)))
        movingLabel.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.numberOfTapsRequired = 2
    }
    
    func addRotationGesture() {
        let rotationGestureRecognizer = UIRotationGestureRecognizer()
        rotationGestureRecognizer.addTarget(self, action: #selector(rotateTheLabel(sender:)))
        movingLabel.addGestureRecognizer(rotationGestureRecognizer)
    }
    
    func addPanGesture() {
        let movingGestureRecognizer = UIPanGestureRecognizer()
        movingGestureRecognizer.addTarget(self, action: #selector(moveTheLabel(sender:)))
        movingLabel.addGestureRecognizer(movingGestureRecognizer)
        movingLabel.isUserInteractionEnabled = true
        initialPoint = movingLabel.frame.origin
    }
    
    @objc func moveTheLabel(sender: UIPanGestureRecognizer) {
        print("the Label was dragged to point \(sender.translation(in: view))")
        let translatedPoint = sender.translation(in: view)
        // x += y == x = x+y
        sender.view?.frame.origin.x = initialPoint.x + translatedPoint.x
        sender.view?.frame.origin.y = initialPoint.y + translatedPoint.y
    }
    
    @objc func rotateTheLabel(sender: UIRotationGestureRecognizer) {
        print("the Label was rotated to point \(sender.rotation)radians")
        let rotatedTransform = CGAffineTransform(rotationAngle: sender.rotation)
        movingLabel.transform = rotatedTransform
        
    }
    @objc func pinchTheLabel(sender: UIPinchGestureRecognizer) {
        gestureRecognizer.view != movingLabel
        
        if sender.state == .began || gestureRecognizer.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 2.0
            
        }
    }
    
    @objc func tapTheLabel(sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 2
        var numberOfTaps: Int = 0
        
        if tap == false {
            labelName()
            numberOfTaps -= 2
            print ("number of taps :",numberOfTaps)
            print("the Label changed back ")
            tap = true
        }
            
        else if tap == true {
            addnameChange()
            numberOfTaps += 2
            print ("number of taps :",numberOfTaps)
            print("the Label changed ")
            tap = false
        }
        
        
    }
}
