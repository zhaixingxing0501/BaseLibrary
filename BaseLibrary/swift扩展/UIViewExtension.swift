//
//  UIViewExtension.swift
//  BaseLibrary
//
//  Created by nucarf on 2020/11/18.
//

import Foundation
import UIKit


//MARK: - CollectionView 扩展方法
extension UICollectionView {
    func reloadData(animation: Bool = true) {
        if animation {
            reloadData()
        } else {
            UIView .performWithoutAnimation {
                reloadData()
            }
        }
    }
}

//MARK: - UIFont 扩展方法
extension UIFont {
    func fontSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    func fontBlod(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }

    func fontMedium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
}




