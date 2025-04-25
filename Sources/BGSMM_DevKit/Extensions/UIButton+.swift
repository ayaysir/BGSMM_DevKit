//
//  UIButton+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public extension UIButton {
  /// 원형 버튼 설정
  @IBInspectable var circleButton: Bool {
    set(isCircle) {
      if isCircle {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
      } else {
        self.layer.cornerRadius = 0
      }
    } get {
      return self.circleButton
    }
  }
  
  /// 이미지 색상 반전
  func invertImage() {
    guard let image = image(for: .normal)?.cgImage else { return }
    let ciImage = CIImage(cgImage: image)
    
    let filter = CIFilter(name: "CIColorInvert")
    filter?.setValue(ciImage, forKey: kCIInputImageKey)
    
    if let outputImage = filter?.outputImage {
      let context = CIContext()
      if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
        let invertedImage = UIImage(cgImage: cgImage)
        setImage(invertedImage, for: .normal)
      }
    }
  }
}
#endif
