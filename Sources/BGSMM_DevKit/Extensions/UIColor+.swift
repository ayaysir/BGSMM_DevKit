//
//  UIColor+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import UIKit

public extension UIColor {
  convenience init?(hex: String) {
    guard let intVal = sanitize(hex: hex) else {
      return nil
    }
    
    let (r, g, b, a) = colorComponents(from: intVal)
    self.init(red: r, green: g, blue: b, alpha: a)
  }
}
