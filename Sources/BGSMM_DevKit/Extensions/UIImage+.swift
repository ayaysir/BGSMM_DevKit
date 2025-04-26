//
//  UIImage+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public extension UIImage {
  /// 이미지에 알파(투명도) 값을 적용한 새 이미지를 반환합니다.
  ///
  /// - Parameter alpha: 적용할 투명도 값 (0.0 = 완전 투명, 1.0 = 불투명).
  /// - Returns: 지정된 알파 값을 적용한 새로운 `UIImage` 객체.
  func withAlpha(_ alpha: CGFloat) -> UIImage {
    UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { _ in
      draw(
        in: CGRect(origin: .zero, size: size),
        blendMode: .normal,
        alpha: alpha
      )
    }
  }
  
  /// 이미지를 Document 폴더에 저장
  /// https://stackoverflow.com/questions/32836862
  func saveToDocumentDirectory(filename: String) throws {
    guard let documentDIR = URL.documentsDirectory else {
      return
    }
    
    let fileURL = documentDIR.appendingPathComponent(filename)
    
    try ImageIOUtil().saveImage(self, to: fileURL)
  }
  
  /// 지정한 Core Image 필터를 적용한 새 이미지를 반환합니다.
  ///
  /// - Parameter filterName: 적용할 Core Image 필터 이름. 기본값은 "CIPhotoEffectNoir"입니다.
  /// - Returns: 필터가 적용된 새로운 `UIImage` 객체. 필터 적용에 실패하면 `nil`을 반환합니다.
  func filter(ciPhotoEffectName filterName: String) -> UIImage? {
    let context = CIContext(options: nil)
    if let filter = CIFilter(name: filterName) {
      filter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
      
      if let output = filter.outputImage {
        if let cgImage = context.createCGImage(output, from: output.extent) {
          return UIImage(cgImage: cgImage)
        }
      }
    } else {
      // msg: 해당하는 필터가 없습니다.
    }
    
    return nil
  }
  
  /// 현재 이미지를 그레이스케일(흑백)로 변환한 새 이미지를 반환합니다.
  /// - **알파(투명도)**를 버리고 그레이스케일만 그립니다 (CGImageAlphaInfo.none).
  ///
  /// - Returns: 변환된 그레이스케일 `UIImage` 객체. 변환에 실패하면 `nil`을 반환합니다.
  var convertToGrayScale: UIImage? {
    let imageRect: CGRect = CGRect(
      x: 0,
      y: 0,
      width: size.width,
      height: size.height
    )
    
    let colorSpace = CGColorSpaceCreateDeviceGray()
    let width = size.width
    let height = size.height
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
    let context = CGContext(
      data: nil,
      width: Int(width),
      height: Int(height),
      bitsPerComponent: 8,
      bytesPerRow: 0,
      space: colorSpace,
      bitmapInfo: bitmapInfo.rawValue
    )
    
    if let cgImage {
      context?.draw(cgImage, in: imageRect)
      if let makeImg = context?.makeImage() {
        let imageRef = makeImg
        let newImage = UIImage(cgImage: imageRef)
        return newImage
      }
    }
    
    return nil
  }
  
  /// 이미지 위에 지정한 텍스트를 그리고, 새로운 이미지를 반환합니다.
  /// https://stackoverflow.com/questions/28906914/how-do-i-add-text-to-an-image-in-ios-swift
  ///
  /// - Parameters:
  ///   - text: 이미지 위에 그릴 텍스트.
  ///   - point: 텍스트를 시작할 위치 (`CGPoint`).
  ///   - font: 텍스트에 사용할 폰트 (`UIFont`).
  /// - Returns: 텍스트가 그려진 새로운 `UIImage` 객체. 실패하면 `nil`을 반환합니다.
  func drawText(
    text: String,
    at point: CGPoint,
    font: UIFont
  ) -> UIImage? {
    let textColor = UIColor.white
    
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    paragraphStyle.alignment = .center
    let textFontAttributes: [NSAttributedString.Key: Any] = [
      .font: font,
      .foregroundColor: textColor,
      .paragraphStyle: paragraphStyle
    ]
    
    draw(in: CGRect(origin: CGPoint.zero, size: size))
    
    let rect = CGRect(origin: point, size: size)
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
  }
}
#endif
