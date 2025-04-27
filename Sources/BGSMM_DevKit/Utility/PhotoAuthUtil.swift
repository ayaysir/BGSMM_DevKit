//
//  PhotoAuthUtil.swift
//  BGSMM_DevKit
//
//  Created by 윤범태 on 4/27/25.
//

#if os(iOS) || os(visionOS)
import UIKit
import Photos

// MARK: - photoAuth 함수를 main 스레드에서 실행 (UI 관련 문제 방지)

public func photoAuth(
  isCamera: Bool,
  viewController: UIViewController,
  completion: @escaping () -> ()
) {
  DispatchQueue.main.async {
    photoAuthInner(
      isCamera: isCamera,
      viewController: viewController,
      completion: completion
    )
  }
}

// MARK: - 사진 라이브러리의 권한을 묻고, 이후 () -> () 클로저를 실행하는 함수

@available(iOS 14, *)
public func authPhotoLibrary(_ viewController: UIViewController, completion: @escaping () -> ()) {
  PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
    photoAuth(isCamera: false, viewController: viewController, completion: completion)
  }
}

// MARK: - 카메라의 권한을 묻고, 이후 () -> () 클로저를 실행하는 함수

public func authDeviceCamera(_ viewController: UIViewController, completion: @escaping () -> ()) {
  if UIImagePickerController.isSourceTypeAvailable(.camera) {
    AVCaptureDevice.requestAccess(for: .video) { status in
      photoAuth(isCamera: true, viewController: viewController, completion: completion)
    }
  } else {
    // 시뮬레이터 등에서 카메라를 사용할 수 없는 경우
    DispatchQueue.main.async {
      // simpleAlert(viewController, message: notAvailableMsg)
      SimpleAlert.showCautionAlert(message: "loc.camera_unavailable")
    }
  }
}

// MARK: - 스레드를 고려하지 않은 photoAuth 함수

fileprivate func photoAuthInner(
  isCamera: Bool,
  viewController: UIViewController,
  completion: @escaping () -> ()
) {
  let sourceName = (isCamera ? "loc.camera" : "loc.photo_library").localized
  
  let status: Int = isCamera
  ? AVCaptureDevice.authorizationStatus(for: AVMediaType.video).rawValue
  : PHPhotoLibrary.authorizationStatus().rawValue
  
  // PHAuthorizationStatus
  // AVAuthorizationStatus
  switch status {
  case 0:
    // .notDetermined
    SimpleAlert.showYesNoAlert(
      title: "loc.permission_denied".localized,
      message: "loc.permission_denied".localizedFormat(sourceName),
      btnYesStyle: .destructive
    )
  case 1:
    // .restricted
    SimpleAlert.showCautionAlert(message: "loc.restricted_message".localized)
  case 2:
    // .denied
    print("CALLBACK FAILED: \(sourceName) is .denied")
    SimpleAlert.showYesNoAlert(
      title: "loc.permission_denied".localized,
      message: "loc.denied_message".localized,
      btnYesStyle: .destructive
    )
  case 3:
    // .authorized
    completion()
  case 4:
    // .limited (라이브러리 전용)
    completion()
  default:
    print("CALLBACK FAILED: \(sourceName) is unknwon state.")
  }
}
#endif
