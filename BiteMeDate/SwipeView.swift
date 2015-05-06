//
//  SwipeView.swift
//  BiteMeDate
//
//  Created by Mike Neirinck on 3/05/15.
//  Copyright (c) 2015 mike.neirinck. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {
    
    private let card: CardView = CardView()
    private var originalPoint: CGPoint?
    
    enum Direction {
        case None
        case Left
        case Right
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    override init() {
        super.init()
        self.initialize()
    }
    
    private func initialize() {
        // change back to ClearColor
        self.backgroundColor = UIColor.redColor()
        self.addSubview(self.card)
        
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
        self.card.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//        self.card.setTranslatesAutoresizingMaskIntoConstraints(false)
        
//        self.setConstraints()
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        let distance = gestureRecognizer.translationInView(self)
        println("Distance: x \(distance.x) y \(distance.y)")
        
        switch gestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            self.originalPoint = self.center
        case UIGestureRecognizerState.Changed:
            let rotationPercent = min(distance.x/(self.superview!.frame.width/2), 1)
            let rotationAngle = (CGFloat(2*M_PI/16)*rotationPercent)
            self.transform = CGAffineTransformMakeRotation(rotationAngle)
            self.center = CGPointMake(self.originalPoint!.x + distance.x , self.originalPoint!.y + distance.y)
        case UIGestureRecognizerState.Ended:
            if abs(distance.x) < self.frame.width/4 {
                self.resetViewPositionAndTransformations()
            } else {
                swipe(distance.x > 0 ? .Right : .Left)
            }
        default:
            println("Default triggered in UIPanGestureRecognizer")
            break
        }
    }
    
    func swipe (s: Direction) {
        if s == .None { return }
        var parentWidth = self.superview!.frame.size.width
        if s == .Left {
            parentWidth *= -1
        }
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center.x = self.frame.origin.x + parentWidth
        })
    }

    private func resetViewPositionAndTransformations(){
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center = self.originalPoint!
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }
    
//    private func setConstraints() {
//        self.addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0))
//    }
    
}