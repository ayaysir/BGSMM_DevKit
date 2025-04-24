//
//  Bundle+.swift
//  Pods
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

internal class VoidClass {}

internal extension Bundle {
  /// SPM 또는 CocoaPods에서 현지화된 모듈 번들을 반환
  static var localizedModule: Bundle {
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
