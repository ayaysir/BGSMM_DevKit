//
//  FirstrunUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/25/25.
//

import Foundation

func checkAppStatus(firstrun: () -> (), updated: () -> (), nothingChanged: () -> ()) {
  let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  let versionOfLastRun = UserDefaults.standard.object(forKey: "VersionOfLastRun") as? String
  
  if versionOfLastRun == nil {
    // First start after installing the app
    firstrun()
  } else if versionOfLastRun != currentVersion {
    // App was updated since last run
    updated()
  } else {
    // nothing changed
    nothingChanged()
  }
  
  UserDefaults.standard.set(currentVersion, forKey: "VersionOfLastRun")
  UserDefaults.standard.synchronize()
}
