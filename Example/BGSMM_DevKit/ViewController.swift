//
//  ViewController.swift
//  BGSMM_DevKit
//
//  Created by 40187546 on 10/25/2022.
//  Copyright (c) 2022 40187546. All rights reserved.
//

import UIKit
import BGSMM_DevKit

class ViewController: UIViewController {

    private var alert: SimpleAlert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        alert = SimpleAlert(targetViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnActAlert1(_ sender: UIButton) {
        alert.present(message: "Alert 1", title: "Alert Test")
    }
    
}

