//
//  ViewController.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
final class NewsVC: BaseViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    var newsArray: [NewsEntity]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
        requestService()
    }
    func setStyles() {
        titleLbl.font = UIFont.setCustomFont(name: .title)
        titleLbl.text = "NewsVC.title".localized
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
        refreshControl.tintColor = .clear
        tableView.addSubview(refreshControl)
    }
    @objc func refreshTable(_ sender: AnyObject) {
        requestService()
    }
    func requestService() {
        startLoader()
        let manager = APIManager.shared
        manager.delegate = self
        manager.getFunction(url: URLs.news.rawValue, serviceName: NewsResponse.name)
    }
}
extension NewsVC: DelegateAPIManager {
    func responseSucess<T>(response: T, serviceName: String) {
        switch serviceName {
            case NewsResponse.name:
                processNews(response: response)
            default:
                self.stopLoader()
        }
    }
    func responseError(message: String) {
        stopLoader()
        refreshControl.endRefreshing()
    }
}
extension NewsVC {
    func processNews<T>(response: T) {
        switch response {
            case let entity as [NewsEntity]:
                newsArray = entity
                tableView.reloadData()
                stopLoader()
                refreshControl.endRefreshing()
            default:
                print("Error")
        }
    }
}
extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        cell.configureCell(item: newsArray?[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = newsArray?[indexPath.row] else {
            showAlert()
            return
        }
        performSegue(withIdentifier: "toDetailNews", sender: selectedItem)
    }
    func showAlert() {
        UIHelper.shared.messageAlert(title: "ViewController.notFoundNews".localized, kind: .actionSheet, presentController: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NewsDetailVC {
            destinationVC.currentNews = sender as? NewsEntity
        }
    }
}
