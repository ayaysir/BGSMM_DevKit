//
//  ImageHeaderData.swift
//  Pods
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public struct ImageHeaderData {
  public static let PNG: [UInt8] = [0x89]
  public static let JPEG: [UInt8] = [0xFF]
  public static let GIF: [UInt8] = [0x47]
  public static let TIFF_01: [UInt8] = [0x49]
  public static let TIFF_02: [UInt8] = [0x4D]
}
