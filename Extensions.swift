//
//  Extensions.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import Foundation
import UIKit
import SwiftUI
import UIKit.UITabBar

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension UITabBar {

    // if tab View is used get tabBar 'isHidden' parameter value
    static func isHidden(_ completion: @escaping (Bool) -> Void)  {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    completion(view.isHidden)
                }
            })
        }
    }

    // if tab View is used toogle Tab Bar Visibility
    static func toogleTabBarVisibility(animated: Bool = true) {
        UITabBar.isHidden { isHidden in
            if isHidden {
                UITabBar.showTabBar(animated: animated)
            }
            else {
                UITabBar.hideTabBar(animated: animated)
            }
        }
    }

    // if tab View is used show Tab Bar
    static func showTabBar(animated: Bool = true) {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.setIsHidden(false, animated: animated)
                }
            })
        }
    }

    // if tab View is used hide Tab Bar
    static func hideTabBar(animated: Bool = true) {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.setIsHidden(true, animated: animated)
                }
            })
        }
    }

    // logic is implemented for hiding or showing the tab bar with animation
    private func setIsHidden(_ hidden: Bool, animated: Bool) {
        let isViewHidden = self.isHidden

        if animated {
            if self.isHidden && !hidden {
                self.isHidden = false
                self.frame.origin.y = UIScreen.main.bounds.height + 200
            }

            if isViewHidden && !hidden {
                self.alpha = 0.0
            }

            UIView.animate(withDuration: 0.8, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            })
            UIView.animate(withDuration: 0.6, animations: {

                if !isViewHidden && hidden {
                    self.frame.origin.y = UIScreen.main.bounds.height + 200
                }
                else if isViewHidden && !hidden {
                    self.frame.origin.y = UIScreen.main.bounds.height - self.frame.height
                }
            }) { _ in
                if hidden && !self.isHidden {
                    self.isHidden = true
                }
            }
        } else {
            if !isViewHidden && hidden {
                self.frame.origin.y = UIScreen.main.bounds.height + 200
            }
            else if isViewHidden && !hidden {
                self.frame.origin.y = UIScreen.main.bounds.height - self.frame.height
            }
            self.isHidden = hidden
            self.alpha = 1
        }
    }
}

extension UIView {

    func allSubviews() -> [UIView] {
        var allSubviews = subviews
        for subview in subviews {
            allSubviews.append(contentsOf: subview.allSubviews())
        }
        return allSubviews
    }
}

import protocol SwiftUI.View
import struct SwiftUI.AnyView

//MARK: For Showing/Hiding Tab Bar

public extension View {
    func showTabBar(animated: Bool = true) -> some View {
        return self.modifier(ShowTabBar(animated: animated))
    }
    func hideTabBar(animated: Bool = true) -> some View {
        return self.modifier(HiddenTabBar(animated: animated))
    }

    func shouldHideTabBar(_ hidden: Bool, animated: Bool = true) -> AnyView {
        if hidden {
            return AnyView(hideTabBar(animated: animated))
        } else {
            return AnyView(showTabBar(animated: animated))
        }
    }
}

struct HiddenTabBar: ViewModifier {
    var animated = true

    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            UITabBar.hideTabBar(animated: animated)
        }
    }
}

struct ShowTabBar: ViewModifier {
    var animated = true
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            UITabBar.showTabBar(animated: animated)
        }
    }
}

extension UIView {
     func makeCornerTabBar(shadowColor: UIColor = UIColor.black,
                     fillColor: UIColor = UIColor.white,
                     opacity: Float = 0.2,
                     corners: UIRectCorner,
                     offset: CGSize = CGSize(width: 0.0, height: 5.0),
                           radius: CGFloat = 0.0, cornerRadius: CGFloat) -> CAShapeLayer {
    
      let shadowLayer = CAShapeLayer()
      shadowLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
      shadowLayer.fillColor = fillColor.cgColor
      shadowLayer.shadowColor = shadowColor.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = offset
      shadowLayer.shadowOpacity = opacity
      shadowLayer.cornerRadius = 20.0
      layer.mask = shadowLayer
      layer.insertSublayer(shadowLayer, at: 0)
      return shadowLayer
   }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
