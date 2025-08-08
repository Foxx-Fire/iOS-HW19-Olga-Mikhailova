//
//  ConstraintsExtension.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 08.08.2025.
//

import UIKit

extension UIView {
    
    //MARK: - Для констрейнтов с lessThanOrEqualTo/greaterThanOrEqualTo
    
    func trailing(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -offset).isActive = true
    }
    
    func width(greaterThanOrEqualTo constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }
    
    // MARK: - Size constraints
    
    func setSize(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // MARK: - Сonstraints To Superview
    
    func pinToSuperview() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    func leadingToSuperview(offset: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: offset).isActive = true
    }
    
    func trailingToSuperview(offset: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -offset).isActive = true
    }
    
    func topToSuperview(offset: CGFloat = 0, safeArea: Bool = false) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = safeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor
        topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    func bottomToSuperview(offset: CGFloat = 0, safeArea: Bool = false) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor
        bottomAnchor.constraint(equalTo: anchor, constant: -offset).isActive = true
    }
    
    // MARK: - Horizontal constraints
    
    func horizontalToSuperview(inset: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -inset)
        ])
    }
    
    // MARK: - Center positioning with offset
    
    func centerXToSuperview(offset: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset).isActive = true
    }
    
    // MARK: - Center positioning with offset
    
    func centerYToSuperview(offset: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset).isActive = true
    }
    
    // MARK: - Relative positioning
    
    func centerX(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func pinTopToBottom(of view: UIView, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset).isActive = true
    }
    
    func pinBottomToTop(of view: UIView, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: view.topAnchor, constant: -offset).isActive = true
    }
    
    func pinLeadingToTrailing(of view: UIView, offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset).isActive = true
    }
}
