//
//  Sequence+.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

public extension Sequence {
  
  /**
   시퀀스의 각 요소를 기준으로 이전 요소, 현재 요소, 다음 요소를 함께 반환합니다.
   
   사용 예시:
   ```swift
   array.enumerated().withPreviousAndNext.compactMap { (prev, curr, next) in
   // prev: 이전 요소, curr: 현재 요소, next: 다음 요소
   }
   ```
   
   예제:
   ```swift
   let arr = [10, 20, 30]
   let result = arr.withPreviousAndNext
   
   /*
    인 경우 result는
    +------+------+------+
    | prev | curr | next |
    +======+======+======+
    |  nil |  10  |  20  |
    +------+------+------+
    |  10  |  20  |  30  |
    +------+------+------+
    |  20  |  30  |  nil |
    +------+------+------+
    */
   ```
   - 첫 번째 요소의 `이전 요소`는 `nil`
   - 마지막 요소의 `다음 요소`는 `nil`입니다.
   
   - Returns: `(이전 요소, 현재 요소, 다음 요소)` 형태의 튜플 배열을 반환합니다.
   */
  var withPreviousAndNext: [(Element?, Element, Element?)] {
    let optionalSelf = self.map(Optional.some)
    let next = optionalSelf.dropFirst() + [nil]
    let prev = [nil] + optionalSelf.dropLast()
    return zip(self, zip(prev, next)).map {
      ($1.0, $0, $1.1)
    }
  }
}
