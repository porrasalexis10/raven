//
//  NewsDetailVC.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
final class NewsDetailVC: BaseViewController {
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var byLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var fullNewsBtn: UIButton!
    /// Variable del listado de noticias
    var currentNews: NewsCoreData?
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
    }
    /// Función para dar estilo a la pantalla
    func setStyles() {
        guard let news = currentNews else { return }
        newsImg.customRounded(type: .full)
        titleLbl.font = UIFont.setCustomFont(name: .title)
        titleLbl.text = news.title
        summaryLbl.font = UIFont.setCustomFont(name: .text)
        summaryLbl.text = news.summary
        byLbl.font = UIFont.setCustomFont(name: .text)
        byLbl.text = news.autor
        dateLbl.font = UIFont.setCustomFont(name: .note)
        dateLbl.text = news.date
        fullNewsBtn.underlineStyle()
    }
    /// Acción para abrir noticia completa
    @IBAction func fullNewsAction(_ sender: Any) {
        guard let news = currentNews else { return }
        guard let url = URL(string: news.url ?? "") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
