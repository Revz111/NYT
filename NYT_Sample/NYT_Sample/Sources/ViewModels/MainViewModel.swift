//
//  MainViewModel.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 28/06/2023.
//

import Foundation
import Foundation

class MainViewModel {
    var newsLoaded: (([News]?, Bool, String?) -> Void)?
    var news: [News]?
    var page: Int = 1
    
    func loadNews(_ page: Int = 1) {
        self.page = page
        NetworkManager.shared.fetchPopularNews(page, completionHandler: { [weak self] (response,error)  in
            DispatchQueue.main.async {
                if let news =  response as? [News] {
                    self?.news = news
                    if let newsLoaded = self?.newsLoaded {
                        newsLoaded(self?.news, true, nil)
                    }
                } else {
                    self?.newsLoaded?(nil, false, error.debugDescription)
                }
            }
        })
    }
}
