//
//  UISegmentControl+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

extension UISegmentedControl {
  /// 기존 세그먼트를 새로운 세그먼트로 강제 대체합니다.
  public func replaceSegments(segments: Array<String>) {
    self.removeAllSegments()
    
    for segment in segments {
      self.insertSegment(withTitle: segment, at: self.numberOfSegments, animated: false)
    }
  }
}
#endif
