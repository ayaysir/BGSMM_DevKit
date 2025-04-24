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
    
    // SimpleAlert.actionText = AlertActionText(CAUTION: "주의", OK: "OK", NO: "아니오", YES: "예", CANCEL: "취소")
    
    let array = ["a", "b"]
    print("Safe Subscription:", array[safe: 3] ?? "safely subscripted!")
   
    print(Locale.preferredLanguages)
    
    print("efff fdsf ad".containsOR("xxx", "eff")) // true
    print("efff fdsf ad".containsAND("fds", "eff")) // true
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
    SimpleAlert.showOKAlert(title: "Normal Alert", message: "Normal Alert Message") {  _ in
      print(#function, "completionHandler")
    }
  }
  
  private func titleOnlyAlert() {
    SimpleAlert.showOKAlert(title: "Title only")
  }
  
  private func messageWithCautionTitle() {
    SimpleAlert.showCautionAlert(message: "Caution Message")
  }
  
  private func yesAndNo() {
    SimpleAlert.showYesNoAlert(
      title: "Yes or No",
      message: "Yes? No?",
      btnYesStyle: .default) { action in
        print(#function, action.title ?? "Selected YES")
      }
  }
  
  private func destructiveYesAndNo() {
    SimpleAlert.showYesNoAlert(
      title: "Yes or No",
      message: "Yes? No?",
      btnYesStyle: .destructive) { action in
        print(#function, action.title ?? "Selected YES")
      }
  }
}

