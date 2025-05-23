//
//  CGSize+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import CoreGraphics

public extension CGSize {
  /// x배 확대/축소
  func scale(_ scale: CGFloat) -> CGSize {
    CGSize(width: self.width * scale, height: self.height * scale)
  }
}
