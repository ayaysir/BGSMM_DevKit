//
//  Date+relativeTimeText.swift
//  Pods
//
//  Created by 윤범태 on 4/27/25.
//

// https://stackoverflow.com/questions/27310883
import Foundation

public extension Date {
  
  /// 현재 날짜로부터 몇 년이 지났는지 반환합니다.
  var yearsFromNow: Int {
    Calendar.current.dateComponents([.year], from: self, to: Date()).year!
  }
  
  /// 현재 날짜로부터 몇 개월이 지났는지 반환합니다.
  var monthsFromNow: Int {
    Calendar.current.dateComponents([.month], from: self, to: Date()).month!
  }
  
  /// 현재 날짜로부터 몇 주가 지났는지 반환합니다.
  var weeksFromNow: Int {
    Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear!
  }
  
  /// 현재 날짜로부터 몇 일이 지났는지 반환합니다.
  var daysFromNow: Int {
    Calendar.current.dateComponents([.day], from: self, to: Date()).day!
  }
  
  /// 이 날짜가 어제인지 여부를 반환합니다.
  var isInYesterday: Bool {
    Calendar.current.isDateInYesterday(self)
  }
  
  /// 현재 날짜로부터 몇 시간이 지났는지 반환합니다.
  var hoursFromNow: Int {
    Calendar.current.dateComponents([.hour], from: self, to: Date()).hour!
  }
  
  /// 현재 날짜로부터 몇 분이 지났는지 반환합니다.
  var minutesFromNow: Int {
    Calendar.current.dateComponents([.minute], from: self, to: Date()).minute!
  }
  
  /// 현재 날짜로부터 몇 초가 지났는지 반환합니다.
  var secondsFromNow: Int {
    Calendar.current.dateComponents([.second], from: self, to: Date()).second!
  }
  
  /// 현재 날짜 기준으로 상대적인 시간을 문자열로 반환합니다.
  ///
  /// - 예: "2 years ago", "Yesterday", "Just now" 등
  var relativeTime: String {
    if yearsFromNow > 0 {
      return String(
        format: "loc.n_years_ago".localized,
        yearsFromNow
      )
    }

    if monthsFromNow > 0 {
      return String(
        format: "loc.n_months_ago".localized,
        monthsFromNow
      )
    }

    if weeksFromNow > 0 {
      return String(
        format: "loc.n_weeks_ago".localized,
        weeksFromNow
      )
    }

    if isInYesterday {
      return "loc.yesterday".localized
    }

    if daysFromNow > 0 {
      return String(
        format: "loc.n_days_ago".localized,
        daysFromNow
      )
    }

    if hoursFromNow > 0 {
      return String(
        format: "loc.n_hours_ago".localized,
        hoursFromNow
      )
    }

    if minutesFromNow > 0 {
      return String(
        format: "loc.n_minutes_ago".localized,
        minutesFromNow
      )
    }

    if secondsFromNow > 0 {
      return secondsFromNow < 15
      ? "loc.just_now".localized
      : String(
          format: "loc.n_seconds_ago".localized,
          secondsFromNow
        )
    }

    return ""
  }
}
