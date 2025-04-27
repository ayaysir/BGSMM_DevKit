//
//  UIColor+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import UIKit

protocol HasColorTransformations {
  associatedtype ColorType
  
  /// 현재 색상과 대비되는 색상(흰색 또는 검정색)을 반환합니다.
  /// - 밝기 계산에서 사용되는 가중치는 국제 표준인 ITU-R Recommendation BT.601 (비디오 신호 처리 표준)에서 정의
  /// - `Y = 0.299R + 0.587G + 0.114B`
  /// - [ITU-R Recommendation BT.601](https://www.itu.int/dms_pubrec/itu-r/rec/bt/r-rec-bt.601-7-201103-i%21%21pdf-e.pdf) 문서의 2.5.1 섹션
  ///
  /// - Returns: 대비색 (`.black` 또는 `.white`)
  var contrastingColor: ColorType? { get }
  
  /// 현재 색상의 반전(inverted) 색상 반환
  var invertedColor: ColorType? { get }
  
  /// 현재 색상을 Hex 스트링으로 변환
  /// - Parameter isAlphaIncluded: Alpha 또는 Opacity 값을 포함하는지
  func hex(isAlphaIncluded: Bool) -> String?
}

extension UIColor: HasColorTransformations {
  public typealias ColorType = UIColor
  
  /// Hex 스트링 (예: `#FFFFFF`)으로 색상 초기화
  public convenience init?(hex: String) {
    guard let intVal = sanitize(hex: hex) else {
      return nil
    }
    
    let (r, g, b, a) = colorComponents(from: intVal)
    self.init(red: r, green: g, blue: b, alpha: a)
  }
  
  public var contrastingColor: UIColor? {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    // 현재 색상에서 red, green, blue, alpha를 추출
    guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
      // RGB 변환 실패 시 nil 반환
      return nil
    }

    // 밝기 계산 (sRGB 기준 상대 밝기)
    let brightness = (0.299 * red + 0.587 * green + 0.114 * blue)

    return brightness > 0.5 ? .black : .white
  }
  
  public var invertedColor: UIColor? {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
      return nil
    }
    
    return .init(
      red: 1.0 - red,
      green: 1.0 - green,
      blue: 1.0 - blue,
      alpha: alpha
    )
  }
  
  public func hex(isAlphaIncluded: Bool = false) -> String? {
    guard let components = cgColor.components, components.count >= 3 else {
      return nil
    }
    
    let r = Int(components[0] * 255)
    let g = Int(components[1] * 255)
    let b = Int(components[2] * 255)
    
    return if isAlphaIncluded, components.count >= 4 {
      String(format: "#%02X%02X%02X%02X", r, g, b, Int(components[3] * 255))
    } else {
      String(format: "#%02X%02X%02X", r, g, b)
    }
  }
}
