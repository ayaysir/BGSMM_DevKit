//
//  Date+.swift
//  
//
//  Created by yoonbumtae on 2023/02/07.
//

import Foundation

public extension Date {
  /// 주어진 캘린더 컴포넌트들을 현재 날짜에서 추출하여 반환합니다.
  /// - Parameters:
  ///   - components: 추출할 캘린더 컴포넌트들 (예: [.year, .month, .day])
  ///   - calendar: 사용할 캘린더. 기본값은 현재 시스템 캘린더입니다.
  /// - Returns: 요청한 컴포넌트들을 포함한 `DateComponents`
  func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
    calendar.dateComponents(Set(components), from: self)
  }
  
  /// 주어진 하나의 캘린더 컴포넌트를 현재 날짜에서 정수로 추출하여 반환합니다.
  /// - Parameters:
  ///   - component: 추출할 단일 캘린더 컴포넌트 (예: `.day`)
  ///   - calendar: 사용할 캘린더. 기본값은 현재 시스템 캘린더입니다.
  /// - Returns: 해당 컴포넌트에 대한 정수값
  func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
    calendar.component(component, from: self)
  }
  
  /// 현재 날짜에서 연, 월, 일 컴포넌트만 추출하여 반환합니다.
  /// - Returns: `.year`, `.month`, `.day`가 포함된 `DateComponents`
  func ymdComponents(calendar: Calendar = Calendar.current) -> DateComponents {
    calendar.dateComponents([.year, .month, .day], from: self)
  }
  
  /// 연월일만 뽑기 - 예) 20201203
  var ymdText: String {
    let year = get(.year)
    let month = get(.month) <= 9 ? "0\(get(.month))" : "\(get(.month))"
    let day = get(.day) <= 9 ? "0\(get(.day))" : "\(get(.day))"
    
    return "\(year)\(month)\(day)"
  }
}

