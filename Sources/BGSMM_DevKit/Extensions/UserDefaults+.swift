//
//  UserDefaults+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

import Foundation

public extension UserDefaults {
  /// 첫 번째 실행 시 확인 - 앱 설치 후 첫 번째 호출 시에만 true, 이후 모든 호출 시 false
  /// 참고: 이 플래그를 확인하는 위치가 여러 곳인 경우 AppDelegate에 이 값을 저장하세요.
  static func isFirstLaunch() -> Bool {
    let hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
    let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
    if isFirstLaunch {
      UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
      UserDefaults.standard.synchronize()
    }
    
    return isFirstLaunch
  }
}
