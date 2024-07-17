//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController {
    
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var scrollView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
    
    @IBAction func agreeButtonPressed(_ sender: UIButton) {
        
        print("agreeButtonPressed is pressed")
    }
    
}

extension TermsPrivacyViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY + height >= contentHeight {
                
            agreeButton.isEnabled = true
            }
    }
}
