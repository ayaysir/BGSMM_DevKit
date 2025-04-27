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
  
  /// 정수에 영어에서 사용되는 서수(순서를 나타내는 접미사; st, nd, rd, th)를 붙여 문자열로 반환합니다.
  ///
  /// - Returns: 서수 접미사가 붙은 문자열입니다. (예: "5th")
  var oridnalText: String {
    let ones = self % 10
    let tens = (self / 10) % 10

    // 10~19번은 모두 "th"를 사용
    if tens == 1 {
      return "\(self)th"
    }
    
    // 1, 2, 3은 각각 "st", "nd", "rd"를 사용
    let suffixDictionary: [Int: String] = [
      1: "st",
      2: "nd",
      3: "rd"
    ]
    
    let suffix = suffixDictionary[ones] ?? "th" // default는 "th"
    return "\(self)\(suffix)"
  }
}
