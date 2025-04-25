//
//  UIApplication+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public extension UIApplication {
  /// Detect if app is running in Slide Over or Split View mode
  /// https://stackoverflow.com/questions/31367387
  var isSplitOrSlideOver: Bool {
      guard let window = self.windows.filter({ $0.isKeyWindow }).first else { return false }
      return !(window.frame.width == window.screen.bounds.width)
  }
}
#endif
