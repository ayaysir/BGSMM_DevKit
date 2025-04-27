//
//  Calendar+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public extension Calendar {
  /// 두 날짜 사이의 일수를 반환합니다. (시·분·초는 무시하고 날짜만 비교)
  /// - Parameters:
  ///   - from: 시작 날짜
  ///   - to: 종료 날짜
  /// - Returns: 두 날짜 사이의 일 수. 계산할 수 없으면 `nil`.
  func daysBetween(_ from: Date, _ to: Date) -> Int? {
    let fromDate = startOfDay(for: from)
    let toDate = startOfDay(for: to)
    let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)

    return numberOfDays.day
  }
}
