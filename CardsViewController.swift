//
//  CardsViewController.swift
//  BiteMeDate
//
//  Created by Mike Neirinck on 3/05/15.
//  Copyright (c) 2015 mike.neirinck. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardStackView: UIView!

    let backCardTopMargin: CGFloat = 10.0
    let frontCardTopMargin: CGFloat = 0
    
    var backCard: SwipeView?
    var frontCard: SwipeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.cardStackView.backgroundColor = UIColor.clearColor()
        
        self.backCard = SwipeView(frame: self.createCardFrame(self.backCardTopMargin))
        self.frontCard = SwipeView(frame: self.createCardFrame(self.backCardTopMargin))
        
        self.cardStackView.addSubview(self.backCard!)
        self.cardStackView.addSubview(self.frontCard!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0, y: topMargin, width: self.cardStackView.frame.width, height: self.cardStackView.frame.height)
    }
}
