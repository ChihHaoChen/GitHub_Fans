//
//  GFDataLoadingVC.swift
//  GitHub_Fans
//
//  Created by ChihHao on 2020/02/04.
//  Copyright © 2020 ChihHao. All rights reserved.
//

import UIKit

class GFDataLoadingVC: UIViewController {

	fileprivate var containerView: UIView!
	
    func showLoadingView()	{
		containerView = UIView(frame: view.bounds)
		view.addSubview(containerView)
		
		containerView.backgroundColor = .systemBackground
		containerView.alpha = 0
		
		UIView.animate(withDuration: 0.3) {
			self.containerView.alpha = 0.8
		}
		
		let activityIndicator = UIActivityIndicatorView(style: .large)
		containerView.addSubview(activityIndicator)
		
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
		])
		
		activityIndicator.startAnimating()
	}
	
	
	func dismissLoadingView()	{
		DispatchQueue.main.async {
			self.containerView.removeFromSuperview()
			self.containerView = nil
		}
	}
	
	
	func showEmptyStateView(with message: String, in view: UIView)	{ // Augment view is to know which view that emptyStateView gonna be attached to
		let emptyStateView = GFEmptyStateView(message: message)
		emptyStateView.frame = view.bounds
		view.addSubview(emptyStateView)
	}

}
