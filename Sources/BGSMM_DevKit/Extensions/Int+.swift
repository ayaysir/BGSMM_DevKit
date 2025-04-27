//
//  Int+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

import Foundation

public extension Int {
  /// 현재 정수를 CGFloat로 변환 후 반환
  var cgFloat: CGFloat {
    CGFloat(self)
  }
  
  /// 해당 Int가 특정 범위 내에 속해 있는지 여부
  func isWithin(_ range: ClosedRange<Int>) -> Bool {
    range ~= self
  }
}
