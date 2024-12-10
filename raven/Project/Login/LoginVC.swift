//
//  LoginVC.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
import LocalAuthentication
final class LoginVC: BaseViewController {
    /// Imagen de compañia
    @IBOutlet weak var companyImg: UIImageView!
    /// Label para usuario
    @IBOutlet weak var userLbl: UILabel!
    /// Textfield para usuario
    @IBOutlet weak var userTextField: UITextField!
    /// Label para contraseña
    @IBOutlet weak var passwordLbl: UILabel!
    /// Textfield para contraseña
    @IBOutlet weak var passwordTextField: UITextField!
    /// Botón para iniciar sesión
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
        hideKeyboardWhenTappedAround()
        #if DEBUG
            userTextField.text = "alexis@gmail.com"
            passwordTextField.text = "123456"
        #else
         // No debugging information in release build
        #endif
    }
    /// Función para cargar estilos
    func setStyles() {
        companyImg.customRounded(type: .full)
        userLbl.font = UIFont.setCustomFont(name: .text)
        userTextField.font = UIFont.setCustomFont(name: .text)
        passwordLbl.font = UIFont.setCustomFont(name: .text)
        passwordTextField.font = UIFont.setCustomFont(name: .text)
        userLbl.text = "LoginVC.user".localized
        passwordLbl.text = "LoginVC.password".localized
        loginBtn.fillStyle()
    }
    /// Función que valida los datos para iniciar sesión y retorna boleano
    func validateLogin() -> String? {
        guard let user = userTextField.text, !user.isEmpty else {
            return "LoginVC.missingUser".localized
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            return "LoginVC.missingPassword".localized
        }
        return nil
    }
    /// Función que valida los datos para iniciar sesión con biometria y retorna boleano
    func validateBiometricLogin() -> String? {
        guard let user = userTextField.text, !user.isEmpty else {
            return "LoginVC.missingUser".localized
        }
        return nil
    }
    // MARK: Actions
    @IBAction func continueAction(_ sender: Any) {
        successLogin()
    }
    func successLogin() {
        startLoader()
        if let errorMessage = validateLogin() {
            showToastMessage(message: errorMessage, fromViewController: self)
            stopLoader()
            return
        }
        let manager = APIManager.shared
        manager.delegate = self
        manager.postSimulateFunction(serviceName: LoginResponse.name)
    }
}
extension LoginVC: DelegateAPIManager {
    func responseSucess<T>(response: T, serviceName: String) {
        guard let loginResponse = response as? LoginResponse else { return }
        MyUserDefaults.isLogged = true
        self.stopLoader()
        UIHelper.shared.setRootController(storyboard: .home)
    }
    func responseError(message: String) {
        showToastMessage(message: message, fromViewController: self)
        stopLoader()
    }
}
