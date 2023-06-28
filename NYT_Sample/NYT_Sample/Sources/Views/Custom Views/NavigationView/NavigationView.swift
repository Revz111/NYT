//
//  NavigationView.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//


import Foundation
import UIKit

final class NavigationView: UIView {

	private static let NIB_NAME = "NavigationView"

	@IBOutlet private var view: UIView!
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var menuButton: UIButton!
	@IBOutlet private weak var searchButton: UIButton!
	@IBOutlet private weak var moreButton: UIButton!
	var onButtonAction: ((Int) -> Void)?

	override func awakeFromNib() {
		initWithNib()
	}

	private func initWithNib() {
		Bundle.main.loadNibNamed(NavigationView.NIB_NAME, owner: self, options: nil)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.view)
        self.setupLayout()
	}

	private func setupLayout() {
		NSLayoutConstraint.activate(
			[
                self.view.topAnchor.constraint(equalTo: topAnchor),
                self.view.leadingAnchor.constraint(equalTo: leadingAnchor),
                self.view.bottomAnchor.constraint(equalTo: bottomAnchor),
                self.view.trailingAnchor.constraint(equalTo: trailingAnchor),
			]
		)
	}

	@IBAction func buttonAction(_ sender: UIButton) {
		self.onButtonAction?(sender.tag)
	}
}
