//
//  NetworkService.swift
//  GitHub_Fans
//
//  Created by ChihHao on 2020/01/08.
//  Copyright © 2020 ChihHao. All rights reserved.
//

import Foundation

class NetworkService	{
	let baseURL = "https://api.github.com/users/"
	let perPageFollowers = 100
	// Baseline for Singleton, only one instance is allowed, and static
	static let shared = NetworkService()
	private init()	{}
	
	func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, ErrorMessage?) -> Void)	{
		let endpoint = baseURL + "\(username)/followers?per_page=\(perPageFollowers)&page=\(page)"
		
		guard let url = URL(string: endpoint)	else	{
			completed(nil, .invalideUsername)
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let _ = error	{
				completed(nil, .unableToComplete)
				return
			}
			
			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else	{
				completed(nil, .invalidResponse)
				return
			}
			
			guard let data = data else	{
				completed(nil, .invalidData)
				return
			}
			
			do	{
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let followers = try decoder.decode([Follower].self, from: data)
				completed(followers, nil)
			} catch {
				completed(nil, .invalidData)
			}
		}
		task.resume()  // To start the network call
	}
}
