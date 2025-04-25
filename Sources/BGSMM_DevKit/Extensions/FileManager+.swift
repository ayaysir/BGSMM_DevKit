//
//  FileManager+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

import Foundation

public extension FileManager {
  /// 파일 복사, 도착 주소에 파일이 이미 존재하면 지우고 복사
  func secureCopyItem(at srcURL: URL, to dstURL: URL) throws {
    if FileManager.default.fileExists(atPath: dstURL.path) {
      try FileManager.default.removeItem(at: dstURL)
    }
    
    try FileManager.default.copyItem(at: srcURL, to: dstURL)
  }
}
