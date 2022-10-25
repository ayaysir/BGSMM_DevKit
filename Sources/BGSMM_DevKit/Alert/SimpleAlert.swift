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
}

public struct SimpleAlert {
    
    // MARK: - static
    
    public typealias Handler = ((UIAlertAction) -> Void)
    
    public static var actionText = AlertActionText()
    public static var targetVC: UIViewController? = nil
    
    public static func present(message: String? = nil,
                               title: String? = nil,
                               handler: Handler? = nil) {
        
        guard let targetVC = targetVC ?? UIApplication.shared.topMostViewController() else {
            fatalError("The Target View Controller could not be specified.")
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionText.OK, style: .default, handler: handler)
        alertController.addAction(alertAction)

        targetVC.present(alertController, animated: true, completion: nil)
        
    }
    
    public static func presentCaution(message: String, handler: Handler? = nil) {
        present(message: message, title: actionText.CAUTION, handler: handler)
    }
    
    // Type 2: Yes And No
    public static func yesAndNo(message: String? = nil,
                        title: String? = nil,
                        btnYesStyle: UIAlertAction.Style = .default,
                        yesHandler: Handler? = nil) {
        
        guard let targetVC = targetVC ?? UIApplication.shared.topMostViewController() else {
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
        
        alertController.addAction(UIAlertAction(title: actionText.CANCEL, style: .cancel, handler: nil))
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = sourceView ?? controller.view.window
            presenter.sourceRect = sourceRect ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        controller.present(alertController, animated: true, completion: nil)
    }
}

#endif
