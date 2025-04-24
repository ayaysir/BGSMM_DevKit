//
//  Bundle+.swift
//  Pods
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

internal class VoidClass {}

internal extension Bundle {
  static var localModule: Bundle {
    Bundle(for: VoidClass.self)
  }
}
