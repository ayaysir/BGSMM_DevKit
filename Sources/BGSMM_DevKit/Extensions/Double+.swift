//
//  Double+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

public extension Double {
  /// 해당 값의 퍼센트를 소수점 첫째자리에서 반올림한 후 퍼센트 마크(%)를 붙임
  var percentageText: String {
    String(format: "%.0f%", self * 100)
  }
}
