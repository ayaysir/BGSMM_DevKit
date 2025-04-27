//
//  UIUserInterfaceStyle.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

@available(iOS 12.0, *)
extension UIUserInterfaceStyle {
  private var localizedMenuText: String {
    switch self {
    case .unspecified:
      return "loc.use_device_theme".localized
    case .light:
      return "loc.light_theme".localized
    case .dark:
      return "loc.dark_theme".localized
    @unknown default:
      return "loc.unknown".localized
    }
  }
  
  private var emoji: String {
    switch self {
    case .unspecified:
      return "📱"
    case .light:
      return "☀️"
    case .dark:
      return "🌒"
    @unknown default:
      return "🤨"
    }
  }
  
  var localizedMenuTextWithEmoji: String {
    return "\(emoji) \(localizedMenuText)"
  }
  
  /// 모든 윈도우(`UIApplication.shared.windows`)의 인터페이스 스타일을 현재 스타일(`self`)로 덮어씌웁니다.
  ///
  /// iOS 13 이상에서만 `overrideUserInterfaceStyle`을 사용할 수 있습니다. 13 미만에서는 별다른 처리를 하지 않습니다.
  ///
  /// - 사용 예시:
  /// ```swift
  /// UIUserInterfaceStyle.dark.overrideAllWindow()
  /// ```
  ///
  /// 이 코드를 호출하면 앱 내 모든 윈도우가 다크 모드로 강제 적용됩니다.
  @available(iOS 13.0, *)
  func overrideAllWindow() {
    UIApplication.shared.windows.forEach { window in
      window.overrideUserInterfaceStyle = self
    }
    
    // iOS 13 미만에서는 다크 모드가 공식적으로 지원되지 않으므로 별도 처리를 하지 않습니다.
  }
}
#endif
