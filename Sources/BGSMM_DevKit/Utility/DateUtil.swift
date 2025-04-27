//
//  DateUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public struct DateUtil {
  private init() {}
  
  /// 1일을 초수로 변환한 값
  /// - 24(시간) × 60(분) × 60(초) = 86,400초
  static let secondsInADay: TimeInterval = 86400
  
  /// 주어진 일(day)을 초(second) 단위로 변환합니다.
  /// - Parameter day: 변환할 일 수
  /// - Returns: 일 수 × 86400초
  public static func dayToSecond(_ day: Int) -> TimeInterval {
    TimeInterval(day) * secondsInADay
  }
}
