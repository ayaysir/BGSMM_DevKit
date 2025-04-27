//
//  UIViewController+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

#if os(iOS)
import UIKit

extension UIViewController {
  /// 내비게이션 바의 높이를 반환
  var topBarHeight: CGFloat {
    var top = self.navigationController?.navigationBar.frame.height ?? 0.0
    
    if #available(iOS 13.0, *) {
      top += UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
      top += UIApplication.shared.statusBarFrame.height
    }
    
    return top
  }
}
#endif
