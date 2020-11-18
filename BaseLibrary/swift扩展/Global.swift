//
//  Global.swift
//  BaseLibrary
//
//  Created by nucarf on 2020/11/18.
//

import Foundation
import UIKit

/// 是否是iPhoneX
/// - Returns: Bool
func isIphoneX() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0
}



func getWindow() -> UIWindow {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows[0]
    }
    return UIApplication.shared.keyWindow!
}


// MARK: App 常量

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHegiht = UIScreen.main.bounds.height

let kAppInfo = Bundle.main.infoDictionary

let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height

let kNavigationBarHeight = isIphoneX() ? 44 + kStatusBarHeight : 20 + kStatusBarHeight

let kTarBarHeight = isIphoneX() ? 83.0 : 49.0

let kSafeBottomHeight = isIphoneX() ? 34.0 : 0.0

