//
//  URL+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public extension URL {
  /// 문서(Document) 디렉토리 URL 반환
  static var documentsDirectory: URL? {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
  }
  
  /// 임시 디렉토리 URL 반환
  static var temporaryDirectory: URL {
    FileManager.default.temporaryDirectory
  }
  
  /// URL에 대한 임시 파일 링크(하드링크)를 임시 폴더에 생성
  /// https://stackoverflow.com/questions/19959642
  func createLinkToFile(withName fileName: String) throws -> URL? {
    // get the temp directory and append the new file name
    let linkURL = URL.temporaryDirectory.appendingPathComponent(fileName)
    let fileManager = FileManager.default
    
    // there is already a hard link with that name
    if fileManager.fileExists(atPath: linkURL.path) {
      try fileManager.removeItem(at: linkURL)     // get rid of it
    }
    
    // create the hard link
    try fileManager.linkItem(at: self, to: linkURL)
    
    return linkURL
  }
}
