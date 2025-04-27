//
//  SwiftUI.Color+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import SwiftUI

@available(iOS 14.0, *)
extension Color {
  /// HEX 스트링으로
  func toHex() -> String? {
    guard let components = UIColor(self).cgColor.components,
          components.count >= 3 else {
      return nil
    }
    
    let r = Int(components[0] * 255)
    let g = Int(components[1] * 255)
    let b = Int(components[2] * 255)
    
    return String(format: "#%02X%02X%02X", r, g, b)
  }
  
  /// HEX 스트링으로부터: 여러 포맷 지원
  init?(hex: String) {
    guard let intVal = sanitize(hex: hex) else {
      return nil
    }
    
    let (r, g, b, a) = colorComponents(from: intVal)

    self.init(red: r, green: g, blue: b, opacity: a)
  }
  

}
