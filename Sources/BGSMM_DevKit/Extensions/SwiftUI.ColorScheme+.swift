//
//  SwiftUI.ColorScheme+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import SwiftUI

@available(iOS 13.0, *)
public extension ColorScheme {
  /// 1을 입력하면 light, 2를 입력하면 dark, 그 외의 경우 nil(시스템 설정) 반환
  static func fromAppAppearance(_ appearance: Int) -> ColorScheme? {
    switch appearance {
    case 1: return .light
    case 2: return .dark
    default: return nil // 시스템 설정 따름
    }
  }
}
