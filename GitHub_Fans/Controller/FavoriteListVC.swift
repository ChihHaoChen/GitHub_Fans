//
//  FavoriteListVC.swift
//  GitHub_Fans
//
//  Created by ChihHao on 2020/01/02.
//  Copyright © 2020 ChihHao. All rights reserved.
//

import UIKit

class FavoriteListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
		
		PersistenceService.retrieveFavorites { (result) in
			switch result {
				case .success(let favorites):
					print(favorites)
				case .failure(let error):
					break
			}
		}
    }
    

}
