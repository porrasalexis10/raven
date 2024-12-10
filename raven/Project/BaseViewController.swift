//
//  BaseViewController.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
import UIKit
import Lottie
class BaseViewController: UIViewController {
    private var animationName = "Loading"
    private var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// Función para animación de carga
    func startLoader(animation: String? = nil) {
        var splashAnimation = animationName
        if let customAnimation = animation {
            splashAnimation = customAnimation
        }
        animationView = .init(name: splashAnimation)
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
    }
    /// Función para detener animación de carga
    func stopLoader() {
        animationView!.stop()
        animationView!.removeFromSuperview()
    }
    /// Parameters:
    /// message: Mensaje de error opcional, si no se envia texto se muestra texto genérico.
    /// fromViewController: controlador donde se presentara el mensaje.
    func showToastMessage(message: String? = nil, fromViewController: UIViewController) {
        let defaultMessage = "BaseViewController.defaultError".localized
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.getAssetColor(name: .principalColor)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 10;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.getAssetColor(name: .principalBackground)
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont.setCustomFont(name: .text)
        toastLabel.text = defaultMessage
        if let textMessage = message {
            toastLabel.text = textMessage
        }
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        toastContainer.addSubview(toastLabel)
        fromViewController.view.addSubview(toastContainer)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 10)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -10)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -10)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 10)
        toastContainer.addConstraints([a1, a2, a3, a4])
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: fromViewController.view, attribute: .leading, multiplier: 1, constant: 20)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: fromViewController.view, attribute: .trailing, multiplier: 1, constant: -20)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: fromViewController.view, attribute: .bottom, multiplier: 1, constant: -40)
        fromViewController.view.addConstraints([c1, c2, c3])
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    /// Función para cerrar vista dependiendo forma de presentación
    /// Parameters:
    /// - IsModal: Indica forma de presentación de pantalla
    func closeView(isModal: Bool) {
        if isModal {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

