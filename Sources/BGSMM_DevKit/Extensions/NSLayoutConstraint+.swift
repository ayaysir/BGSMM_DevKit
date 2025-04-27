//
//  NSLayoutConstraint+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

extension NSLayoutConstraint {
  /**
   Change multiplier constraint.
   https://stackoverflow.com/questions/19593641
   
   - parameter multiplier: CGFloat
   - returns: NSLayoutConstraint
   */
  func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
    
    NSLayoutConstraint.deactivate([self])
    
    let newConstraint = NSLayoutConstraint(
      item: firstItem as Any,
      attribute: firstAttribute,
      relatedBy: relation,
      toItem: secondItem,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: constant)
    
    newConstraint.priority = priority
    newConstraint.shouldBeArchived = self.shouldBeArchived
    newConstraint.identifier = self.identifier
    
    NSLayoutConstraint.activate([newConstraint])
    
    return newConstraint
  }
}
