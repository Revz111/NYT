//
//  String.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

extension String
{
	func getCompletepath( page: Int, apiKey: String) -> String {
		return self + "\(page)" + ".json?api-key=" + apiKey
	}
}
