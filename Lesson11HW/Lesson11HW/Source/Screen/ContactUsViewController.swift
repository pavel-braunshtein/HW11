//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        print("submitButtonPressed is pressed")
        textView.resignFirstResponder()
    }
    
    func updateLabel (amount: Int) {
        
        let remainingSymbols = max(0, 320 - amount)
            countLabel.text = "\(remainingSymbols) symbols left"
    }
    
}

extension ContactUsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
//        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let newText = (textView.text ?? "") + text
        
        if newText.isEmpty {
            
            textLabel.isHidden = false
        } else {
            textLabel.isHidden = true
        }
        
        if newText.count >= 15 && newText.count <= 320 {
    
            submitButton.isEnabled = true
            updateLabel(amount: newText.count)
            return true
        } else {
            
            if newText.count >= 320 {
                let trimmedText = String(newText.prefix(320))
                textView.text = trimmedText
                submitButton.isEnabled = true
            } else {
                submitButton.isEnabled = false
            }
            
            updateLabel(amount: newText.count)
            return newText.count <= 320
        }
    }
    
}
