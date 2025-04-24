//
//  UITextField+.swift
//  Pods
//
//  Created by 윤범태 on 4/25/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

extension UITextField {
  @IBInspectable var doneAccessory: Bool {
    get {
      return self.doneAccessory
    }
    
    set(hasDone) {
      if hasDone {
        addDoneButtonOnKeyboard()
      }
    }
  }
  
  /// 숫자 키패드 위에 완료(Done) 버튼 붙임
  func addDoneButtonOnKeyboard() {
    let doneToolbar: UIToolbar = UIToolbar(
      frame: CGRect.init(
        x: 0,
        y: 0,
        width: UIScreen.main.bounds.width,
        height: 50
      )
    )
    doneToolbar.barStyle = .default
    
    let flexSpace = UIBarButtonItem(
      barButtonSystemItem: .flexibleSpace,
      target: nil,
      action: nil
    )
    let done: UIBarButtonItem = UIBarButtonItem(
      title: "loc.done".localized,
      style: .done,
      target: self,
      action: #selector(self.doneButtonAction)
    )
    
    let items = [flexSpace, done]
    doneToolbar.items = items
    doneToolbar.sizeToFit()
    
    self.inputAccessoryView = doneToolbar
  }
  
  @objc func doneButtonAction() {
    self.resignFirstResponder()
  }
}
#endif
