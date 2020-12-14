//
//  ViewController.swift
//  iOSCarePlus
//
//  Created by Jinha Park on 2020/12/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var logoView: UIView!
    @IBOutlet var logoViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var backgroundImageViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationSettingDefault()
        
        appearLogoViewAnimation { [weak self] in
            self?.slideBackgroundImageAnimation()
            self?.blinkLogoAnimation()
        }
    }
    
    private func animationSettingDefault() {
        logoView.alpha = 1
        logoViewTopConstraint.constant = -200
        backgroundImageViewLeadingConstraint.constant = 0
        view.layoutIfNeeded()
    }
    
    private func appearLogoViewAnimation(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.7, delay: 1, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: []) { [weak self] in
            self?.logoViewTopConstraint.constant = 17
            self?.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
    
    private func slideBackgroundImageAnimation() {
        UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseInOut, .repeat, .autoreverse]) { [weak self] in
            self?.backgroundImageViewLeadingConstraint.constant = -800
            self?.view.layoutIfNeeded()
        }
    }
    
    private func blinkLogoAnimation() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) { [weak self] in
            self?.logoView.alpha = 0
        }
    }
}

