//
//  String+Localization.swift
//  Pods
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

public extension String {
  var localized: String {
    return NSLocalizedString(
      self,
      tableName: "Localizable",
      bundle: .localModule,
      value: self,
      comment: ""
    )
  }
  
  func localizedFormat(_ arguments: CVarArg...) -> String {
    let localizedValue = self.localized
    return String(format: localizedValue, arguments: arguments)
  }
  
  var addEllipsis: String {
    self + "…"
  }
}
