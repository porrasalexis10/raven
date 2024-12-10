//
//  UpdateAppVC.swift
//  baseProject
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 06/12/24.
//
import UIKit
final class UpdateAppVC: BaseViewController {
    /// Label para Texto
    @IBOutlet weak var messageLbl: UILabel!
    /// Botón para descargar app
    @IBOutlet weak var downloadBtn: UIButton!
    /// Botón para cerrar app
    @IBOutlet weak var closeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
    }
    /// Función para cargar estilos
    func setStyles() {
        messageLbl.font = UIFont.setCustomFont(name: .text)
        messageLbl.text = "UpdateAppVC.message".localized
        downloadBtn.fillStyle()
        closeBtn.fillStyle()
    }
    // MARK: Actions
    @IBAction func downloadVersion(_ sender: Any) {
        if let url = URL(string: "https://www.google.com.mx/") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func closeApp(_ sender: Any) {
        exit(0)
    }
}
