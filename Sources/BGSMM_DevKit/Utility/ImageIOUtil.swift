//
//  ImageIOUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import UIKit
import ImageIO

public struct ImageIOUtil {
  
  /// 이미지 저장
  func saveImage(_ image: UIImage, to url: URL) throws {
    guard let data = image.pngData() ?? image.jpegData(compressionQuality: 1) else {
      return
    }
    
    try data.write(to: url)
  }
  
  /// UIImage로부터 섬네일 만들기
  func makeImageThumbnail(from image: UIImage, maxPixelSize: Int = 100) throws -> UIImage? {
    guard let data = image.pngData() ?? image.jpegData(compressionQuality: 1) else {
      return nil
    }
    
    let options = [
      kCGImageSourceCreateThumbnailWithTransform: true,
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      kCGImageSourceThumbnailMaxPixelSize: maxPixelSize] as CFDictionary // Specify your desired size at kCGImageSourceThumbnailMaxPixelSize.
    
    var thumbnail: UIImage?
    data.withUnsafeBytes { ptr in
      guard let bytes = ptr.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
        return
      }
      
      if let cfData = CFDataCreate(kCFAllocatorDefault, bytes, data.count){
        let source = CGImageSourceCreateWithData(cfData, nil)!
        let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)!
        thumbnail = UIImage(cgImage: imageReference) // You get your thumbail here
      }
    }
    
    return thumbnail
  }
}
