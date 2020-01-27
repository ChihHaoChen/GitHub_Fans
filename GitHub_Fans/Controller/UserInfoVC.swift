//
//  UserInfoVC.swift
//  GitHub_Fans
//
//  Created by ChihHao on 2020/01/14.
//  Copyright © 2020 ChihHao. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

	var username: String!
	
	let headerView = UIView()
	let itemViewOne = UIView()
	let itemViewTwo = UIView()
	var itemViews: [UIView] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureViewController()
		layoutUI()
		getUserInfo()
		
    }
	
	func getUserInfo()	{
		NetworkService.shared.getUserInfo(for: username) { [weak self] result in
			guard let self = self else { return }
			
			switch result	{
				case .success(let user):
					DispatchQueue.main.async {
						self.addChildView(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
					}

				case .failure(let error):
					self.presentGFAlertOnMainThread(title: "Something went wrong!", message: error.rawValue, buttonTitle: "Ok")
			}
		}
	}
	
	func configureViewController()	{
		view.backgroundColor = .systemBackground
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
		navigationItem.rightBarButtonItem = doneButton
	}
    
	@objc func dismissVC()	{
		dismiss(animated: true)
	}
	
	func layoutUI()	{
		let padding: CGFloat = 20
		let itemHeight: CGFloat = 180
		itemViews = [headerView, itemViewOne, itemViewTwo]
		
		for itemView in itemViews	{
			view.addSubview(itemView)
			itemView.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
				itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			])
		}
		
		itemViewOne.backgroundColor = .systemPink
		itemViewTwo.backgroundColor = .systemBlue
		
		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			headerView.heightAnchor.constraint(equalToConstant: 180),
			
			itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
			itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
			
			itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
			itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
		])
	}
	
	func addChildView(childVC: UIViewController, to containerView: UIView)	{
		addChild(childVC)
		containerView.addSubview(childVC.view)
		childVC.view.frame = containerView.bounds
		childVC.didMove(toParent: self)
	}
}
