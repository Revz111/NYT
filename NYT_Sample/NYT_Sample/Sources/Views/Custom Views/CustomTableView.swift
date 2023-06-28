//
//  CustomTableView.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import UIKit

class CustomTableView: UITableView {
	override var intrinsicContentSize: CGSize {
		self.layoutIfNeeded()
		return self.contentSize
	}

	override var contentSize: CGSize {
		didSet{
			self.invalidateIntrinsicContentSize()
		}
	}

	override func reloadData() {
		super.reloadData()
		self.invalidateIntrinsicContentSize()
	}
}
