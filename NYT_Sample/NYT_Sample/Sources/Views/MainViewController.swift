//
//  MainViewController.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import UIKit

class MainViewController: UIViewController {

    private var mainViewModel = MainViewModel()
	@IBOutlet weak var navigationView: NavigationView!
	@IBOutlet weak var loader: UIActivityIndicatorView!
	@IBOutlet weak var verticalTableView: UITableView!
    @IBOutlet weak var optionsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setupViews()
		self.fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}


// MARK: Initial setups
extension MainViewController {
	func setupViews() {
		self.verticalTableView.dataSource = self
		self.verticalTableView.delegate = self
		self.verticalTableView.register(UINib(nibName: "ContentsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentsTableViewCell")
		self.setNavigationBarActions()
        self.optionsView.isHidden = true
	}

    func fetchData(_ page: Int = 1) {
        self.mainViewModel.loadNews(page)
        self.loader.startAnimating()
        self.mainViewModel.newsLoaded = { [weak self] (_, success, errorMessage) in
            self?.loader.stopAnimating()
            if success {
                self?.verticalTableView.reloadData()
            } else if let message = errorMessage{
                self?.showAlert(message)
            }
        }
	}

	func setNavigationBarActions() {
		self.navigationView.onButtonAction = { [weak self] tag in
			switch tag {
			case 103:
                self?.optionsView.isHidden.toggle()
			default:
				print("Actions not added")
			}
		}
	}
    
    @IBAction func optionsSelected(_ sender: UIButton) {
        self.optionsView.isHidden.toggle()
        let page = sender.tag == 103 ? 30 : (sender.tag == 102 ? 7 : 1)
        guard page != self.mainViewModel.page else { return }
        self.fetchData(page)
    }
    
    private func showAlert(_ message: String) {
            let alert = UIAlertController(title: "API Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let newsDetailVC = storyBoard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else { return }
        self.navigationController?.pushViewController(newsDetailVC, animated: true)
	}

	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.mainViewModel.news?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentsTableViewCell", for: indexPath) as? ContentsTableViewCell
		else { return UITableViewCell() }
		if let news = self.mainViewModel.news?[indexPath.row] {
			cell.setData(news)
		}
        cell.selectionStyle = .none
		return cell
	}
}
