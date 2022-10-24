//
//  SimpleAlert.swift
//  
//
//  Created by yoonbumtae on 2022/10/25.
//

#if os(iOS)

import UIKit

public enum AlertActionText: String {
    case CAUTION = "ALERT_CAUTION"
    case OK = "ALERT_OK"
    case NO = "ALERT_NO"
    case YES = "ALERT_YES"
    case CANCEL = "ALERT_CANCEL"
    
    public func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

public struct SimpleAlert {
    
    private var targetVC: UIViewController!
    
    public init(targetViewController targetVC: UIViewController) {
        self.targetVC = targetVC
    }
    
    // Type 1: Title and Message
    public func simpleAlert(message: String? = nil,
                     title: String? = nil,
                     handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: AlertActionText.OK.localized(), style: .default, handler: handler)
        alertController.addAction(alertAction)
    
        targetVC.present(alertController, animated: true, completion: nil)
    }
    
    public func simpleAlertCaution(messageOnly message: String) {
        simpleAlert(message: message, title: AlertActionText.CAUTION.localized(), handler: nil)
    }
    
    // Type 2: Yes And No
    func simpleYesAndNo(message: String? = nil,
                        title: String? = nil,
                        btnNoStyle: UIAlertAction.Style = .cancel,
                        yesHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionNo = UIAlertAction(title: AlertActionText.NO.localized(), style: .cancel, handler: nil)
        let alertActionYes = UIAlertAction(title: AlertActionText.NO.localized(), style: .default, handler: yesHandler)
        alertController.addAction(alertActionNo)
        alertController.addAction(alertActionYes)
        targetVC.present(alertController, animated: true, completion: nil)
    }
    
    func simpleActionSheets(_ controller: UIViewController,
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
        
        alertController.addAction(UIAlertAction(title: AlertActionText.CANCEL.localized(), style: .cancel, handler: nil))
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = sourceView ?? controller.view.window
            presenter.sourceRect = sourceRect ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
}

#endif
