//
//  Data+ImageFormat.swift
//  Pods
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation
import ImageIO

extension Data {
  var format: String {
    let array = [UInt8](self)
    
    return switch array[0] {
    case 0xFF:
      "jpg"
    case 0x89:
      "png"
    case 0x47:
      "gif"
    case 0x49, 0x4D :
      "tiff"
    default:
      "unknown"
    }
  }
  
  var imageFormat: ImageFormat {
    if let string = String(data: self, encoding: .isoLatin1) {
      let prefix = String(string.prefix(30))
      
      return if prefix.containsOR("ÿØÿÛ", "ÿØÿà", "JFIF", "ÿØÿá", "Exif") {
        .jpg
      } else if prefix.contains("PNG") {
        .png
      } else if prefix.containsOR("GIF87a", "GIF89a") {
        .gif
      } else if prefix.containsOR("RIFF", "WEBP") {
        .webp
      } else {
        .unknown
      }
    }
    
    return .unknown
  }
}
