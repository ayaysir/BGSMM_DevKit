//
//  Collection+.swift
//  BGSMM_DevKit
//
//  Created by yoonbumtae on 2022/11/04.
//

import Foundation

public extension Collection {
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
