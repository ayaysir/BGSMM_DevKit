//
//  URL+.swift
//  Pods
//
//  Created by 윤범태 on 4/25/25.
//

public extension URL {
  static var documentsDirectory: URL? {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
  }
}
