//
//  NetworkManager.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()

	public var baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
    public var apiKey = "iTa359tg35Xg63H2D0b2D50limIBpI9o"

	typealias NetworkCompletion = (_ response: Any?, _ error: Error?) -> Void

	func fetchPopularNews(_ page: Int = 1,completionHandler: @escaping NetworkCompletion) {

		let completeURLPath = self.baseURL.getCompletepath(page: page, apiKey: self.apiKey)

		guard let url = URL(string: completeURLPath ) else
		{
			completionHandler(nil, nil)
			return
		}

		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
		  if let error = error {
			print("Error with fetching players: \(error)")
            completionHandler(nil, error)
			return
		  }

		  guard let httpResponse = response as? HTTPURLResponse,
				(200...299).contains(httpResponse.statusCode) else {
              print("Error with the response, unexpected status code: \(String(describing: response))")
              completionHandler(nil, nil)
			return
		  }

			if let data = data,
			   let newsResponse = try? JSONDecoder().decode(ResponseData.self, from: data) {
			  completionHandler(newsResponse.news, nil)
		  }
            else {
                completionHandler(nil, nil)
            }
		})
		task.resume()
	}
}
