//
//  CardView.swift
//  BiteMeDate
//
//  Created by Mike Neirinck on 2/05/15.
//  Copyright (c) 2015 mike.neirinck. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    
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
    
    private func initialize () {
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.imageView.backgroundColor = UIColor.redColor()
        self.addSubview(self.imageView)
        
        self.nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.nameLabel)
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        
        // Constraints for ImageView
        
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        
    
        // Constraints for Label
        
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.imageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        
    }
}