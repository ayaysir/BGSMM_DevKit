//
//  SwiftUI.Color+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import SwiftUI

@available(iOS 14.0, *)
extension Color: HasColorTransformations {
  typealias ColorType = Color
  
  public init(compatibleUIColor: UIColor) {
    if #available(iOS 15.0, *) {
      self.init(uiColor: compatibleUIColor)
    } else {
      // iOS 14 fallback
      let components = compatibleUIColor.cgColor.components ?? [0, 0, 0, 1]
      let r = Double(components[safe: 0] ?? 0)
      let g = Double(components[safe: 1] ?? 0)
      let b = Double(components[safe: 2] ?? 0)
      let a = Double(components[safe: 3] ?? 1)
      
      self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
  }
  
  /// HEX 스트링으로부터: 여러 포맷 지원
  public init?(hex: String) {
    guard let intVal = sanitize(hex: hex) else {
      return nil
    }
    
    let (r, g, b, a) = colorComponents(from: intVal)

    self.init(red: r, green: g, blue: b, opacity: a)
  }
  
  public var contrastingColor: Color? {
    guard let contrastingUIColor = UIColor(self).contrastingColor else {
      return nil
    }
    
    return Color(compatibleUIColor: contrastingUIColor)
  }
  
  public var invertedColor: Color? {
    guard let invertedUIColor = UIColor(self).invertedColor else {
      return nil
    }
    
    return Color(compatibleUIColor: invertedUIColor)
  }
  
  public func hex(isAlphaIncluded: Bool = false) -> String? {
    UIColor(self).hex(isAlphaIncluded: isAlphaIncluded)
  }
}
