//
//  ViewController.swift
//  BiteMeDate
//
//  Created by Mike Neirinck on 2/05/15.
//  Copyright (c) 2015 mike.neirinck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(CardView(frame: CGRectMake(10.0, 10.0, 60.0, 100.0)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

