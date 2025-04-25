//
//  UIImageView.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

extension UIImageView {
  /// 이미지에 Corner Radius 지정
  @IBInspectable var roundImage: CGFloat {
    set {
      self.layer.cornerRadius = newValue
    }
    get {
      return self.roundImage
    }
  }
  
  /// 원형 이미지 반환
  @IBInspectable var circleImage: Bool {
    set {
      if newValue {
        self.layer.cornerRadius = self.bounds.size.width * 0.5
      } else {
        self.layer.cornerRadius = 0
      }
    }
    get {
      return self.circleImage
    }
  }
}
#endif
