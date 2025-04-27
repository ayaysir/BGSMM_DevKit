//
//  String+Localization.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

public extension String {
  var localized: String {
    Bundle.localizedModule.localizedString(forKey: self, value: nil , table: nil)
  }
  
  func localizedFormat(_ arguments: CVarArg...) -> String {
    let localizedValue = self.localized
    return String(format: localizedValue, arguments: arguments)
  }
  
  var addEllipsis: String {
    self + "…"
  }
}
