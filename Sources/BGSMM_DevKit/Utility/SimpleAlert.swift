//
//  SimpleAlert.swift
//  BGSMM_DevKit
//
//  Created by yoonbumtae on 2022/10/25.
//

#if os(iOS)

import UIKit

public struct AlertActionText {
  public var CAUTION = "loc.alert.caution".localized
  public var OK = "loc.alert.ok".localized
  public var NO = "loc.alert.no".localized
  public var YES = "loc.alert.yes".localized
  public var CANCEL = "loc.alert.cancel".localized
  
  public init() {}
  
  public init(
    CAUTION: String,
    OK: String,
    NO: String,
    YES: String,
    CANCEL: String
  ) {
    self.CAUTION = CAUTION
    self.OK = OK
    self.NO = NO
    self.YES = YES
    self.CANCEL = CANCEL
  }
}

public struct SimpleAlert {
  public typealias UIAlertActionToVoidHandler = ((UIAlertAction) -> Void)
  public typealias VoidHandler = () -> Void
  
  /// 사용자 지정 경고창 텍스트를 사용할 경우 이 변수를 교체하세요.
  /// 교체하지 않으면 설정된 기본 로컬라이징 텍스트가 표시됩니다.
  public static var actionText = AlertActionText()
  
  /// 지정된 뷰 컨트롤러에서 제목과 선택적인 메시지, 그리고 선택적인 OK 버튼 핸들러를 가진 간단한 OK 알림을 표시합니다.
  /// - `viewController`를 지정하지 않으면 시스템의 most top view controller를 사용합니다. (SwiftUI iOS 앱에서도 사용 가능)
  ///
  /// - Parameters:
  ///   - viewController: 알림을 표시할 뷰 컨트롤러. nil이면 가장 위에 있는 뷰 컨트롤러를 사용합니다.
  ///   - title: 알림의 제목.
  ///   - message: 알림의 선택적인 메시지.
  ///   - okHandler: OK 버튼이 눌렸을 때 실행될 선택적인 핸들러.
  public static func showOKAlert(
    to viewController: UIViewController? = nil,
    title: String,
    message: String? = nil,
    okHandler: UIAlertActionToVoidHandler? = nil
  ) {
    guard let targetVC = viewController ?? UIApplication.shared.topMostViewController() else {
      fatalError("The Target View Controller could not be specified.")
    }
    
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    let alertAction = UIAlertAction(title: actionText.OK, style: .default, handler: okHandler)
    alertController.addAction(alertAction)
    
    targetVC.present(alertController, animated: true, completion: nil)
  }
  
  /// "Caution"이라는 제목과 지정된 메시지를 가진 경고 알림을 표시하며, OK 버튼이 눌렸을 때 실행될 선택적인 핸들러를 받습니다.
  /// - `viewController`를 지정하지 않으면 시스템의 most top view controller를 사용합니다. (SwiftUI iOS 앱에서도 사용 가능)
  ///
  /// - Parameters:
  ///   - message: 경고 알림의 메시지.
  ///   - okHandler: OK 버튼이 눌렸을 때 실행될 선택적인 핸들러.
  public static func showCautionAlert(
    to viewController: UIViewController? = nil,
    message: String,
    okHandler: UIAlertActionToVoidHandler? = nil
  ) {
    guard let targetVC = viewController ?? UIApplication.shared.topMostViewController() else {
      fatalError("The Target View Controller could not be specified.")
    }
    
    showOKAlert(
      to: targetVC,
      title: actionText.CAUTION,
      message: message,
      okHandler: okHandler
    )
  }
  
  // Type 2: Yes And No
  
  /// "Yes"와 "No" 버튼을 가진 알림을 표시하며, 각 버튼에 대한 핸들러를 처리합니다.
  /// - `viewController`를 지정하지 않으면 시스템의 most top view controller를 사용합니다. (SwiftUI iOS 앱에서도 사용 가능)
  ///
  /// - Parameters:
  ///   - viewController: 알림을 표시할 뷰 컨트롤러. nil이면 가장 위에 있는 뷰 컨트롤러를 사용합니다.
  ///   - title: 알림의 제목.
  ///   - message: 알림의 선택적인 메시지.
  ///   - btnYesStyle: "Yes" 버튼의 스타일.
  ///   - yesHandler: "Yes" 버튼이 눌렸을 때 실행될 선택적인 핸들러.
  public static func showYesNoAlert(
    to viewController: UIViewController? = nil,
    title: String,
    message: String? = nil,
    btnYesStyle: UIAlertAction.Style,
    yesHandler: UIAlertActionToVoidHandler? = nil
  ) {
    
    guard let targetVC = viewController ?? UIApplication.shared.topMostViewController() else {
      fatalError("The Target View Controller could not be specified.")
    }
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertActionNo = UIAlertAction(title: actionText.NO, style: .cancel, handler: nil)
    let alertActionYes = UIAlertAction(title: actionText.YES, style: btnYesStyle, handler: yesHandler)
    alertController.addAction(alertActionNo)
    alertController.addAction(alertActionYes)
    targetVC.present(alertController, animated: true, completion: nil)
  }
  
  // Type 3: ActionSheet
  static func actionSheets(_ controller: UIViewController,
                                  actionTitles: [String],
                                  actionStyles: [UIAlertAction.Style]? = nil,
                                  title: String,
                                  message: String = "",
                                  sourceView: UIView?,
                                  sourceRect: CGRect?,
                                  actionCompletion: @escaping (_ actionIndex: Int) -> ()) {
    
    let alertController = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
    alertController.modalPresentationStyle = .popover
    
    for (index, actionTitle) in actionTitles.enumerated() {
      let action = UIAlertAction(title: actionTitle, style: actionStyles?[index] ?? .default, handler: { action in
        actionCompletion(index)
      })
      alertController.addAction(action)
    }
    
    alertController.addAction(UIAlertAction(title: "ALERT_CANCEL", style: .cancel, handler: nil))
    if let presenter = alertController.popoverPresentationController {
      presenter.sourceView = sourceView ?? controller.view.window
      presenter.sourceRect = sourceRect ?? CGRect(x: 0, y: 0, width: 0, height: 0)
    }
    controller.present(alertController, animated: true, completion: nil)
  }
}

#endif
