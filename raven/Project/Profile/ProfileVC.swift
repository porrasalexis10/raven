//
//  ProfileVC.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//

import UIKit

final class ProfileVC: BaseViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var ocupationLbl: UILabel!
    @IBOutlet weak var ocupationTxt: UITextField!
    @IBOutlet weak var closeSessionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        setStyles()
        hideKeyboardWhenTappedAround()
    }
    func addButtons() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = UIColor.getAssetColor(name: .principalColor)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    func setStyles() {
        profileImg.customRounded(type: .full)
        nameLbl.font = UIFont.setCustomFont(name: .text)
        nameLbl.text = "ProfileVC.name".localized
        nameTxt.font = UIFont.setCustomFont(name: .text)
        nameTxt.text = MyUserDefaults.name
        ocupationLbl.font = UIFont.setCustomFont(name: .text)
        ocupationLbl.text = "ProfileVC.position".localized
        ocupationTxt.font = UIFont.setCustomFont(name: .text)
        ocupationTxt.text = MyUserDefaults.position
        closeSessionBtn.fillStyle(color: UIColor.getAssetColor(name: .principalColor))
        closeSessionBtn.setTitle("ProfileVC.closeSession".localized, for: .normal)
    }
    // MARK: Actions
    @objc func backAction() {
        closeView(isModal: true)
    }
    @IBAction func closeSession(_ sender: Any) {
        UIHelper.shared.removeSessionData()
        UIHelper.shared.setRootController(storyboard: .login)
    }
}
