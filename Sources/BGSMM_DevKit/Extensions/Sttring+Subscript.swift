//
//  Sttring+Subscript.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/26/25.
//

import Foundation

public extension String {
   /// 주어진 인덱스 위치에 해당하는 한 글자를 문자열로 반환합니다.
   ///
   /// - Parameter i: 반환할 문자 위치 (0부터 시작).
   /// - Returns: 해당 위치의 한 글자 문자열.
   subscript(_ i: Int) -> String {
     let idx1 = index(startIndex, offsetBy: i)
     let idx2 = index(idx1, offsetBy: 1)
     return String(self[idx1..<idx2])
   }
   
   /// 주어진 범위에 해당하는 문자열을 반환합니다. (반열린 범위)
   ///
   /// - Parameter r: 문자열에서 추출할 `Range<Int>` 범위. `r.lowerBound`부터 `r.upperBound` 미만까지.
   /// - Returns: 주어진 범위의 부분 문자열.
   subscript(r: Range<Int>) -> String {
     let start = index(startIndex, offsetBy: r.lowerBound)
     let end = index(startIndex, offsetBy: r.upperBound)
     return String(self[start ..< end])
   }
   
   /// 주어진 범위에 해당하는 문자열을 반환합니다. (폐쇄 범위)
   ///
   /// - Parameter r: 문자열에서 추출할 `CountableClosedRange<Int>` 범위. `r.lowerBound`부터 `r.upperBound`까지 포함.
   /// - Returns: 주어진 범위의 부분 문자열.
   subscript(r: CountableClosedRange<Int>) -> String {
     let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
     let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
     return String(self[startIndex...endIndex])
   }
}
