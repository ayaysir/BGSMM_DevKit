//
//  Array+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

import Foundation

public extension Array {
  /// 배열을 주어진 크기(size)만큼 나누어 서브 배열로 반환합니다.
  /// ```
  /// input: [1, 2, 3, 4, 5, 6, 7], size: 3 인 경우
  /// output: [[1, 4, 7], [2, 5], [3, 6]]
  /// ```
  ///
  /// 각 서브 배열은 동일한 인덱스 간격으로 요소를 가집니다.
  ///
  /// - Parameter size: 서브 배열로 나눌 간격 크기입니다.
  /// - Returns: 주어진 간격으로 나눈 2차원 배열.
  func splitInSubArrays(into size: Int) -> [[Element]] {
    return (0..<size).map {
      stride(from: $0, to: count, by: size).map { self[$0] }
    }
  }
  
  /// 배열을 주어진 크기(size)로 잘라 일정 크기의 서브 배열로 나눕니다.
  ///
  /// 마지막 서브 배열은 요소 수가 `size`보다 작을 수 있습니다.
  /// ```
  /// input: [1, 2, 3, 4, 5, 6, 7], size: 3 인 경우
  /// output: [[1, 2, 3], [4, 5, 6], [7]]
  /// ```
  ///
  /// - Parameter size: 각 서브 배열의 최대 요소 수입니다.
  /// - Returns: 주어진 크기로 나눈 2차원 배열.
  func chunked(into size: Int) -> [[Element]] {
    stride(from: 0, to: count, by: size).map {
      Array(self[$0 ..< Swift.min($0 + size, count)])
    }
  }
}
