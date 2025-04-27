//
//  JSONUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

@available(iOS 11.0, *)
public extension Encodable {
  /// 현재 객체를 JSON 문자열로 인코딩합니다.
  /// - Parameters:
  ///   - prettyPrinted: JSON을 예쁘게 출력할지 여부를 나타내는 Boolean 값입니다. 기본값은 `true`입니다.
  ///   - iso8601Dates: 날짜를 ISO 8601 형식으로 인코딩할지 여부를 나타내는 Boolean 값입니다. 기본값은 `true`입니다.
  /// - Returns: 객체의 JSON 문자열 표현을 반환하거나, 인코딩에 실패하면 `nil`을 반환합니다.
  /// - Throws: 인코딩에 실패하면 에러를 던집니다.
  func encodeToJSON(
    prettyPrinted: Bool = true,
    iso8601Dates: Bool = true
  ) throws -> String? {
    let encoder = JSONEncoder()
    
    if prettyPrinted {
      encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    }
    
    if iso8601Dates {
      encoder.dateEncodingStrategy = .iso8601
    }

    let data = try encoder.encode(self)
    return String(data: data, encoding: .utf8)
  }
}

/// JSON 문자열을 디코딩하여 지정된 타입의 객체로 변환합니다.
/// - Parameters:
///   - jsonString: 디코딩할 JSON 문자열입니다.
///   - type: 디코딩할 객체의 타입을 지정합니다. 기본값은 `T.self`입니다.
///   - iso8601Dates: 날짜를 ISO 8601 형식으로 디코딩할지 여부를 나타내는 Boolean 값입니다. 기본값은 `true`입니다.
/// - Returns: 지정된 타입의 객체로 변환된 결과를 반환하거나, 변환에 실패하면 `nil`을 반환합니다.
/// - Throws: 디코딩에 실패하면 에러를 던집니다.
@available(iOS 11.0, *)
public func decodeFromJSON<T: Decodable>(
  _ jsonString: String,
  as type: T.Type = T.self,
  iso8601Dates: Bool = true
) throws -> T? {
  let decoder = JSONDecoder()

  if iso8601Dates {
    decoder.dateDecodingStrategy = .iso8601
  }

  guard let data = jsonString.data(using: .utf8) else {
    print("❌ JSON 문자열을 Data로 변환 실패")
    return nil
  }

  return try decoder.decode(T.self, from: data)
}
