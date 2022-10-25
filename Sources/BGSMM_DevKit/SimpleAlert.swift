//
//  SimpleAlert.swift
//  
//
//  Created by yoonbumtae on 2022/10/25.
//

#if os(iOS)

import UIKit

public struct AlertActionText {
    
    public init(CAUTION: String = "ALERT_CAUTION", OK: String = "ALERT_OK", NO: String = "ALERT_NO", YES: String = "ALERT_YES", CANCEL: String = "ALERT_CANCEL") {
        self.CAUTION = CAUTION
        self.OK = OK
        self.NO = NO
        self.YES = YES
        self.CANCEL = CANCEL
    }
    
    public var CAUTION = "ALERT_CAUTION"
    public var OK = "ALERT_OK"
    public var NO = "ALERT_NO"
    public var YES = "ALERT_YES"
    public var CANCEL = "ALERT_CANCEL"
    
    // public func localized() -> String {
    //     #if SWIFT_PACKGE
    //     return NSLocalizedString(self.rawValue, bundle: .module, comment: "")
    //     #endif
    //
    //     // let bundlePath = Bundle().path(forResource: "BGSMM_DevKit" + "_in_podspec", ofType: "bundle")!
    //     return NSLocalizedString(self.rawValue, bundle: .main, comment: "")
    // }
}

public struct SimpleAlert {
    
    private var targetVC: UIViewController!
    public var customActionText: AlertActionText?
    
    private var currentActionText: AlertActionText {
        if let customActionText = customActionText {
            return customActionText
        }
        
        return AlertActionText()
    }
    
    public init(targetViewController targetVC: UIViewController, customActionText: AlertActionText? = nil) {
        self.targetVC = targetVC
        self.customActionText = customActionText
    }
    
    // Type 1: Title and Message
    public func present(message: String? = nil,
                     title: String? = nil,
                     handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: currentActionText.OK, style: .default, handler: handler)
        alertController.addAction(alertAction)
    
        targetVC.present(alertController, animated: true, completion: nil)
    }
    
    public func presentCaution(message: String) {
        present(message: message, title: currentActionText.CAUTION, handler: nil)
    }
    
    // Type 2: Yes And No
    public func yesAndNo(message: String? = nil,
                        title: String? = nil,
                        btnNoStyle: UIAlertAction.Style = .cancel,
                        yesHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionNo = UIAlertAction(title: currentActionText.NO, style: .cancel, handler: nil)
        let alertActionYes = UIAlertAction(title: currentActionText.NO, style: .default, handler: yesHandler)
        alertController.addAction(alertActionNo)
        alertController.addAction(alertActionYes)
        targetVC.present(alertController, animated: true, completion: nil)
    }
    
    public func actionSheets(_ controller: UIViewController,
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
        
        alertController.addAction(UIAlertAction(title: currentActionText.CANCEL, style: .cancel, handler: nil))
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = sourceView ?? controller.view.window
            presenter.sourceRect = sourceRect ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
}

#endif
