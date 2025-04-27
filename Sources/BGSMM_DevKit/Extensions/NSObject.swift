//
//  NSObject.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

public extension NSObject {
  /// 현재 클래스 이름 반환
  var className: String {
    String(describing: self)
  }
}
