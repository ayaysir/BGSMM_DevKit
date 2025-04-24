//
//  String+Contains.swift
//  Pods
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public extension String {
  func containsOR(_ args: String...) -> Bool {
    args.contains(where: self.contains)
  }
  
  func containsAND(_ args: String...) -> Bool {
    args.allSatisfy { self.contains($0) }
  }
  
  func containsOR(_ strings: [String]) -> Bool {
    strings.contains(where: self.contains)
  }
  
  func containsAND(_ strings: [String]) -> Bool {
    strings.allSatisfy { self.contains($0) }
  }
}
