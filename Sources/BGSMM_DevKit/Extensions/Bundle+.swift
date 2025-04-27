//
//  Bundle+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

internal class VoidClass {}

internal extension Bundle {
  /// SPM 또는 CocoaPods에서 현지화된 모듈 번들을 반환
  static var localizedModule: Bundle {
    // ⚠️ if SWIFT_PACKAGE 안에 흐리게 나타나더라도 동작하고 있는 것이므로
    // 반드시 사용해야함. 안하면 SPM에서 로컬라이징 안됨
    
    #if SWIFT_PACKAGE
    // SPM: Bundle.module 사용
    let baseBundle = Bundle.module
    #else
    // CocoaPods: 클래스 기준으로 번들 찾기
    let baseBundle = Bundle(for: VoidClass.self)
    #endif
    
    let languageCode: String
    
    if #available(iOS 16.0, *) {
      languageCode = Locale.preferredLanguages
        .compactMap { Locale(identifier: $0).language.languageCode?.identifier }
        .first ?? "en"
    } else {
      languageCode = Locale.preferredLanguages
        .compactMap { Locale(identifier: $0).languageCode }
        .first ?? "en"
    }

    guard let path = baseBundle.path(forResource: languageCode, ofType: "lproj"),
          let localizedBundle = Bundle(path: path) else {
      return baseBundle // fallback
    }

    return localizedBundle
  }
}
