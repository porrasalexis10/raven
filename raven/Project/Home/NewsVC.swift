//
//  ViewController.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
import CoreData
final class NewsVC: BaseViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    var newsArray: [NewsCoreData]?
    var requestError = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
        fetchNews()
    }
    override func viewDidAppear(_ animated: Bool) {
        requestService()
    }
    /// Función para dar estilo a la pantalla
    func setStyles() {
        titleLbl.font = UIFont.setCustomFont(name: .title)
        titleLbl.text = "NewsVC.title".localized
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
        refreshControl.tintColor = .clear
        tableView.addSubview(refreshControl)
    }
    /// Función para refrescar tabla
    @objc func refreshTable(_ sender: AnyObject) {
        refreshControl.beginRefreshing()
        fetchNews()
    }
    /// Petición de servicio
    func requestService() {
        startLoader()
        let manager = APIManager.shared
        manager.delegate = self
        manager.getFunction(url: URLs.news.rawValue, serviceName: NewsResponse.name)
    }
    /// Obtener información de noticias desde base de datos interna
    func fetchNews() {
        let fetchRequest: NSFetchRequest<NewsCoreData> = NewsCoreData.fetchRequest()
        CoreDataManager.shared.mainManagedObjectContext.performAndWait {
            do {
                newsArray = try CoreDataManager.shared.mainManagedObjectContext.fetch(fetchRequest)
                tableView.reloadData()
                refreshControl.endRefreshing()
            } catch {
                print("Error fetching data: \(error)")
                refreshControl.endRefreshing()
            }
        }
    }
    func successFetch() -> Bool {
        return (newsArray?.count == 0) ? true : false
    }
}
extension NewsVC: DelegateAPIManager {
    /// Respuesta de servicio exitoso
    func responseSucess<T>(response: T, serviceName: String) {
        switch serviceName {
            case NewsResponse.name:
                processNews(response: response)
                stopLoader()
            default:
                stopLoader()
        }
    }
    /// Respuesta de servicio fallido
    func responseError(message: String) {
        requestError = true
        stopLoader()
        showAlert(message: message)
    }
    func processNews<T>(response: T) {
        switch response {
            case let entity as [NewsEntity]:
                saveNewsData(newsServer: entity)
            default:
                print("Error")
        }
    }
    /// Guardar noticias en base de datos interna
    func saveNewsData(newsServer: [NewsEntity]) {
        var savedNews: [NewsCoreData] = []
        for newsIndex in newsServer {
            let news = NSEntityDescription.insertNewObject(forEntityName: "NewsCoreData", into: CoreDataManager.shared.privateManagedObjectContext) as! NewsCoreData
            news.title = newsIndex.title
            news.summary = newsIndex.summary
            news.autor = newsIndex.autor
            news.date = newsIndex.date
            news.url = newsIndex.url
            savedNews.append(news)
        }
        CoreDataManager.shared.deleteAllData(entity: "NewsCoreData")
        CoreDataManager.shared.saveData(objects: savedNews)
    }
}
/// Delegados de tabbla para contador, dibujo de celda, acción de click y control de error
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
            showAlert(message: "ViewController.notFoundNews".localized)
            return
        }
        performSegue(withIdentifier: "toDetailNews", sender: selectedItem)
    }
    func showAlert(message: String) {
        UIHelper.shared.messageAlert(title: message, kind: .actionSheet, presentController: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NewsDetailVC {
            destinationVC.currentNews = sender as? NewsCoreData
        }
    }
}
