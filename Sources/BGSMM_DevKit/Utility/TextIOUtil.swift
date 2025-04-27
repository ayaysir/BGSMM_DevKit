//
//  TextIOUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

/// 텍스트 파일을 자동 인코딩 감지로 읽어서 문자열로 반환합니다.
/// 실패 시 nil 반환
public func readTextFileAutoEncoding(at url: URL) throws -> String {
  var usedEncoding: String.Encoding = .utf8

  return try String(contentsOf: url, usedEncoding: &usedEncoding)
}
