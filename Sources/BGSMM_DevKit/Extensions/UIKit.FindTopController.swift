//
//  FindTopController.swift
//  BGSMM_DevKit
//
//  Created by yoonbumtae on 2022/10/25.
//

#if os(iOS)
import UIKit

// https://stackoverflow.com/a/64301729
extension UIViewController {
  /// 현재 뷰 컨트롤러의 top view controller 반환
  public func topMostViewController() -> UIViewController? {
    if self.presentedViewController == nil {
      return self
    }
    
    if let navigation = self.presentedViewController as? UINavigationController {
      return navigation.visibleViewController?.topMostViewController()
    }
    
    if let tab = self.presentedViewController as? UITabBarController {
      if let selectedTab = tab.selectedViewController {
        return selectedTab.topMostViewController()
      }
      
      return tab.topMostViewController()
    }
    
    return self.presentedViewController?.topMostViewController()
  }
}

extension UIApplication {
  /// 현재 key window의 top view controller 반환
  public func topMostViewController() -> UIViewController? {
    return UIWindow.key?.rootViewController?.topMostViewController()
  }
}

extension UIWindow {
  /// 현재 앱의 key window를 반환
  public static var key: UIWindow? {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.first { $0.isKeyWindow }
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}

#endif

