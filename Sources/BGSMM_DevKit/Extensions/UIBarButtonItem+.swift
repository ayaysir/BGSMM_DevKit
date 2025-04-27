//
//  UIBarButtonItem+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public extension UIBarButtonItem {
  
  /// `UIBarButtonItem`의 프레임 반환
  /// https://stackoverflow.com/questions/14318368
  var frame: CGRect? {
    guard let view = self.value(forKey: "view") as? UIView else {
      return nil
    }
    
    return view.frame
  }
}
#endif
