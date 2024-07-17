//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

class ProfileViewController: BaseViewController {
    
    private var editMode = false
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstNameSymbols: UILabel!
    @IBOutlet weak var lastNameSymbols: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        
        firstName.delegate = self
        lastName.delegate = self
    }
}

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"
        
        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        firstName.isEnabled = editMode
        lastName.isEnabled = editMode
        firstNameSymbols.isHidden = !firstNameSymbols.isHidden
        lastNameSymbols.isHidden = !lastNameSymbols.isHidden
        
        updateRigthtBarButton()
    }
    
    func updateLabel (symbolsNum: Int, label: UILabel) {
        
        if symbolsNum >= 30 {
            
            label.text = "\(30 - symbolsNum) symbols left"
            label.textColor = .red
        } else {
            label.text = "\(30 - symbolsNum) symbols left"
            label.textColor = .green
        }
    }
}

    extension ProfileViewController: UITextFieldDelegate {
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            guard let currentText = textField.text else {
                return true
            }
//            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let newText = currentText + string

            
            if newText.count <= 30 {
                
                if textField == firstName {
                    updateLabel(symbolsNum: newText.count, label: firstNameSymbols)
                } else {
                    updateLabel(symbolsNum: newText.count, label: lastNameSymbols)
                }
                return true
            } else {
                return false
            }
        }
    }
