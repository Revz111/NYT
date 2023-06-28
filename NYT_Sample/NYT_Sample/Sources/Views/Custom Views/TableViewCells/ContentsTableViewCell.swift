//
//  ContentsTableViewCell.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import UIKit

class ContentsTableViewCell: UITableViewCell {
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subTitleLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


// MARK: - Data handling
extension ContentsTableViewCell {
    func setData(_ data: News) {
		precondition(Thread.isMainThread)
        if let imageURl = URL(string: data.media?.first?.mediaMetadata?.first?.url ?? "") {
            self.mainImageView.load(url: imageURl)
        }
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.size.height/2
        self.mainImageView.clipsToBounds = true
        self.titleLabel.text = data.title
        self.subTitleLabel.text = data.abstract
        self.nameLabel.text = data.section
        self.dateLabel.text = data.publishedDate
	}
}
