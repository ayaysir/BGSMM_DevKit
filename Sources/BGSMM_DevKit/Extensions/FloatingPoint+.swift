//
//  Untitled.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

public extension FloatingPoint {
  /// 값이 도(˚)인 경우 -> 라디언
  var degreesToRadians: Self { self * .pi / 180 }
  
  /// 값이 라디언인 경우 경우 -> 도(˚)
  var radiansToDegrees: Self { self * 180 / .pi }
}
