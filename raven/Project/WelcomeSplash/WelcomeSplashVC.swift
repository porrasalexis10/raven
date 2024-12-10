//
//  WelcomeSplashVC.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
import Lottie
final class WelcomeSplashVC: UIViewController {
    let animationName = "Welcome"
    /// Label para texto
    @IBOutlet weak var welcomeLbl: UILabel!
    /// Label para número de versión y build
    @IBOutlet weak var versionLbl: UILabel!
    /// Vista para dibujar la animación
    @IBOutlet var welcomeView: AnimationView!
    /// Lazy var para version de la app
    lazy var version: String = { return Bundle.main.releaseVersionNumber }() ?? ""
    /// Lazy var para build de la app
    lazy var build: String = { return Bundle.main.buildVersionNumber }() ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoader()
        setStyles()
        continueFlowApp()
    }
    /// Función para cargar estilos
    func setStyles() {
        welcomeLbl.text = "WelcomeSplashVC.welcome".localized
        welcomeLbl.font = UIFont.setCustomFont(name: .title)
        versionLbl.text = String(format: "WelcomeSplashVC.version".localized, self.version, self.build)
        versionLbl.font = UIFont.setCustomFont(name: .note)
    }
    /// Función para iniciar animación
    func startLoader() {
        welcomeView = .init(name: animationName)
        welcomeView!.frame = view.bounds
        welcomeView!.contentMode = .scaleAspectFit
        welcomeView!.loopMode = .loop
        welcomeView!.animationSpeed = 0.5
        view.addSubview(welcomeView!)
        welcomeView!.play()
    }
    /// Función para detener animación
    func stopLoader() {
        welcomeView!.stop()
        welcomeView!.removeFromSuperview()
    }
    ///Función para continuar con el flujo de la app
    func continueFlowApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.stopLoader()
            self.setController()
        }
    }
    /// Función para mostrar login o pantalla de inicio
    func setController() {
        if MyUserDefaults.isLogged {
            UIHelper.shared.setRootController(storyboard: .home)
        } else {
            UIHelper.shared.setRootController(storyboard: .login)
        }
    }
}
