//
//  Decimal+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

public extension Decimal {
  /**
   소수점 이하에서 유의미한 자릿수(유효 자릿수)를 반환합니다.
   
   Decimal은 내부적으로 `significand * 10^exponent` 형태로 표현되며,
   `significand`는 가능한 한 가장 작은 정수로 정규화됩니다.
   
   예를 들어:
   - `1230`은 `significand = 123`, `exponent = 1` → 소수점 없음 → 결과: 0
   - `1.23`은 `significand = 123`, `exponent = -2` → 소수점 이하 두 자리 → 결과: 2
   
   따라서 `소수점 이하 자릿수 = -exponent (단, 음수일 경우 0)`으로 계산할 수 있습니다.
   
   ⚠️ **주의**: `Decimal`을 `Double`로부터 생성하면 이진 부동소수점 반올림 오차가 반영되어
   예상보다 많은 소수점 자릿수를 가지게 될 수 있습니다.
   
   예시:
   ```swift
   let n1 = Decimal(0.111)               // Double을 사용 → 이진 오차 포함
   print(n1.significantFractionalDecimalDigits) // 출력: 20 (예상보다 많음)
   
   let n2 = Decimal(string: "0.111")!    // 문자열로 생성 → 정확한 자릿수 유지
   print(n2.significantFractionalDecimalDigits) // 출력: 3 (정확함)
   ```
   
   결론: **정확한 유효 자릿수 계산이 필요하다면, 항상 문자열로 Decimal을 생성하세요.**
   */
  var significantFractionalDecimalDigits: Int {
    max(-exponent, 0)
  }
}
