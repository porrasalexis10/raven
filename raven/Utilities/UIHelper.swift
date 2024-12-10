//
//  UIHelper.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import UIKit
public class UIHelper {
    private init() {}
    public static let shared = UIHelper()
    /// Función para abrir una alerta de sistema
    /// Parametros:
    /// storyboard: Storybboard donde se ubica el controlador que se quiere abrir
    /// identifier: Controlador que se desea abrir
    /// from: Desde donde se manda llamar el nuevo controllador
    func messageAlert(messageServer: String? = nil, title: String, kind: UIAlertController.Style, customAction: UIAlertAction? = nil, presentController: UIViewController){
        var textDefault = "Algo salió mal, intentelo de nuevo más tarde."
        if let message = messageServer {
            textDefault = message
        }
        let alertController = UIAlertController(title: title, message: textDefault, preferredStyle: kind)
        if let myAction = customAction {
            alertController.addAction(myAction)
        } else {
            let okAction = UIAlertAction(title: "Aceptar", style: .default)
            alertController.addAction(okAction)
        }
        presentController.present(alertController, animated: true, completion: nil)
    }
    /// Función para remover variables guardadas dentro de la sesión
    func removeSessionData() {
        UserDefaults.standard.removeObject(forKey: MyUserDefaults.token)
        UserDefaults.standard.synchronize()
    }
    /// Función para cambiar el storyboard inicial
    /// Parameters:
    /// - Variable que indica cual storyboard se presentará
    func setRootController(storyboard: MyStoryboards) {
        let viewController = UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialViewController()
        let window = (UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate).window
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
/// Enum para storyboards declarados en la aplicación
enum MyStoryboards: String {
    case splash = "Splash"
    case login = "Login"
    case home = "Home"
}
