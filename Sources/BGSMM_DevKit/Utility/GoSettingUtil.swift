//
//  GoSettingUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

public func openAppSettings() {
  guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
    return
  }
  
  if UIApplication.shared.canOpenURL(settingsUrl) {
    UIApplication.shared.open(settingsUrl) { success in
      print("Settings opened: \(success)") // Prints true
    }
  }
}
#endif
