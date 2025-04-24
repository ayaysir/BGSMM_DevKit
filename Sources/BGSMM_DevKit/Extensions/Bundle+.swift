//
//  Bundle+.swift
//  Pods
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

internal class BundleFinder {}

internal extension Bundle {
  static var module: Bundle {
    Bundle(for: BundleFinder.self)
  }
}
