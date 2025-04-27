//
//  ColorUtility.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

/// Int로 변환된 Hex값을 입력하면 컬러 컴포넌트 수치를 반환
/// - Returns: `튜플 (r, g, b, a)`
public func colorComponents(from sanitizedHex: Int) -> (
  r: CGFloat,
  g: CGFloat,
  b: CGFloat,
  a: CGFloat
) {
  let r, g, b, a: CGFloat
  let intVal = sanitizedHex
  
  // 비트 수에 따라 RGB 또는 ARGB를 구분
  if intVal >= 0x1000000 { // ARGB (hex: #AARRGGBB, 32비트)
    a = CGFloat((intVal & 0xFF000000) >> 24) / 255
    r = CGFloat((intVal & 0x00FF0000) >> 16) / 255
    g = CGFloat((intVal & 0x0000FF00) >> 8) / 255
    b = CGFloat(intVal & 0x000000FF) / 255
  } else { // RGB (hex: #RRGGBB, 24비트)
    a = 1.0
    r = CGFloat((intVal & 0xFF0000) >> 16) / 255
    g = CGFloat((intVal & 0x00FF00) >> 8) / 255
    b = CGFloat(intVal & 0x0000FF) / 255
  }
  
  return (r, g, b, a)
}
