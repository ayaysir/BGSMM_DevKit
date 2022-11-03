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
        
        SimpleAlert.actionText = AlertActionText(CAUTION: "주의", OK: "OK", NO: "아니오", YES: "예", CANCEL: "취소")
        
        let array = ["a", "b"]
        print("Safe Subscription:", array[safe: 3] ?? "safely subscripted!")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnActAlert1(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            normalAlert()
        case 2:
            titleOnlyAlert()
        case 3:
            messageWithCautionTitle()
        case 4:
            yesAndNo()
        case 5:
            destructiveYesAndNo()
        default:
            break
        }
        
    }
    
    private func normalAlert() {
        SimpleAlert.present(message: "Normal Alert Message", title: "Normal Alert") { _ in
            print(#function, "completionHandler")
        }
    }
    
    private func titleOnlyAlert() {
        SimpleAlert.present(title: "Title Only Alert")
    }
    
    private func messageWithCautionTitle() {
        SimpleAlert.presentCaution(message: "Caution Message")
    }
    
    private func yesAndNo() {
        SimpleAlert.yesAndNo(message: "Are you sure?", title: "Select", btnYesStyle: .default) { _ in
            print(#function, "Selected YES")
        }
    }
    
    private func destructiveYesAndNo() {
        SimpleAlert.yesAndNo(message: "Are you sure?", title: "DESTRUCTIVE ALERT", btnYesStyle: .destructive) { _ in
            print(#function, "Selected YES")
        }
    }
    
}

