//
//  GFButton.swift
//  GitHub_Fans
//
//  Created by ChihHao on 2020/01/02.
//  Copyright © 2020 ChihHao. All rights reserved.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure()  {
        layer.cornerRadius = 10
		setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle:  .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
	
	func set(backgroundColor: UIColor, title: String)	{
		self.backgroundColor = backgroundColor
		setTitle(title, for: .normal)
	}
}
