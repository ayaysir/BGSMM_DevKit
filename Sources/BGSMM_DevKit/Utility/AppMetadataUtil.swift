//
//  AppMetadataUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/24/25.
//

import Foundation

/// 버전, 빌드번호, 애플리케이션 이름, OS 버전 등을 확인합니다.
public struct AppMetadataUtil {
  private init() {}
  
  /// 앱의 마케팅 버전 (예: "1.2.3")을 반환합니다.
  /// - Returns: `CFBundleShortVersionString` 값. 없으면 `nil`.
  public static var appVersion: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  }
  
  /// 앱의 빌드 번호 (예: "42")를 반환합니다.
  /// - Returns: `CFBundleVersion` 값. 없으면 `nil`.
  public static var appBuildNumber: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
  }
  
  /// 앱 버전과 빌드 번호를 하나로 합쳐 반환합니다 (예: "1.2.3 (42)").
  /// - Returns: 버전과 빌드를 합친 문자열. 둘 중 하나라도 없으면 `nil`.
  public static var appVersionAndBuild: String? {
    guard let appVersion, let appBuildNumber else {
      return nil
    }
    
    return "\(appVersion) (\(appBuildNumber))"
  }
  
  /// 앱의 표시 이름 (예: "MyApp")을 반환합니다.
  /// - Returns: `CFBundleDisplayName` 값. 없으면 `nil`.
  public static var appName: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
  }
  
  /// 현재 실행 중인 iOS 버전을 문자열로 반환합니다 (예: "17.4.1").
  /// - Returns: 운영체제의 메이저.마이너.패치 버전 문자열
  public static var osInfo: String {
    let os = ProcessInfo.processInfo.operatingSystemVersion
    return "\(os.majorVersion).\(os.minorVersion).\(os.patchVersion)"
  }
}
