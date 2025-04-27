//
//  StringUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

/// 헥스 스트링으로부터 Int값을 추출
public func sanitize(hex: String) -> Int? {
  var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
  
  if hexSanitized.hasPrefix("#") {
    hexSanitized.removeFirst()
  }
  
  guard hexSanitized.count == 6 || hexSanitized.count == 8 else {
    return nil
  }
  
  return Int(hexSanitized, radix: 16)
}
