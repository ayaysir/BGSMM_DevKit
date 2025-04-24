//
//  SimpleAlert.swift
//  
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

public extension UIAlertAction {
  static let OK = UIAlertAction(title: "ALERT_OK", style: .default, handler: nil)
}

public struct SimpleAlert {
  
  // MARK: - static
  
  public typealias UIAlertActionToVoidHandler = ((UIAlertAction) -> Void)
  public typealias VoidHandler = () -> Void
  
  public static var actionText = AlertActionText()
  // public static var targetVC: UIViewController? = nil
  
  public static func showOKAlert(
    to viewController: UIViewController? = nil,
    title: String,
    message: String? = nil,
    okHandler: UIAlertActionToVoidHandler? = nil
  ) {
    guard let targetVC = viewController ??  UIApplication.shared.topMostViewController() else {
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
  
  public static func showCautionAlert(
    message: String,
    okHandler: UIAlertActionToVoidHandler? = nil
  ) {
    showOKAlert(title: actionText.CAUTION, message: message, okHandler: okHandler)
  }
  
  // Type 2: Yes And No
  public static func showYesNoAlert(
    to viewController: UIViewController? = nil,
    title: String,
    message: String? = nil,
    btnYesStyle: UIAlertAction.Style,
    yesHandler: UIAlertActionToVoidHandler? = nil
  ) {
    
    guard let targetVC = viewController ??  UIApplication.shared.topMostViewController() else {
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
  public static func actionSheets(_ controller: UIViewController,
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
