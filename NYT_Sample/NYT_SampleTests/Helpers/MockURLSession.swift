//
//  Mock.swift
//  NYT_SampleTests
//
//  Created by Revathy Vinod on 28/06/2023.
//
import Foundation

class MockURLSession: URLSession {
  var cachedUrl: URL?
    
  override func dataTask(
    with url: URL,
    completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        return URLSession.shared.dataTask(with: url)
  }
}
