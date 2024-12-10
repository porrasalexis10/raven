//
//  MainTableViewCell.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCell(item: NewsEntity?) {
        if let news = item {
            itemImage.circularView()
            itemImage.backgroundColor = UIColor.getAssetColor(name: .principalColor)
            titleLbl.font = UIFont.setCustomFont(name: .text)
            titleLbl.text = news.title
            dateLbl.font = UIFont.setCustomFont(name: .note)
            dateLbl.text = news.date
        }
    }
}
