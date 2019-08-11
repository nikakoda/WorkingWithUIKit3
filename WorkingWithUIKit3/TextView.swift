//
//  TextView.swift
//  WorkingWithUIKit3
//
//  Created by Ника Перепелкина on 11/08/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

// and Stepper
class TextView: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "Количество символов: 0"
        textView.delegate = self
        textView.text = ""
        
        textView.isHidden = true
      //  textView.alpha = 0
        
        textView.font = UIFont(name: "Chalkduster", size: 18)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        stepper.value = 18
        stepper.maximumValue = 10
        stepper.maximumValue = 30
        
        stepper.tintColor = .gray
        stepper.backgroundColor = .white
        stepper.layer.cornerRadius = 5
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        activityIndicator.startAnimating()
        
        // заморозка экрана
        UIApplication.shared.beginIgnoringInteractionEvents()
        
     //   UIView.animate(withDuration: 0, delay: 3, options: .curveEaseIn, animations: {
     //       self.textView.alpha = 1
     //   }) { (finished) in
     //       self.activityIndicator.stopAnimating()
     //       self.textView.isHidden = false
     //       UIApplication.shared.endIgnoringInteractionEvents()
     //   }
        
        
        progressView.setProgress(0, animated: true)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                UIApplication.shared.endIgnoringInteractionEvents()
                self.progressView.isHidden = true
            }
        }
        
    /*    // отслеживаем появление клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
        // отслеживаем скрытие клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    */
    }
    
    
  
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // скрывает клавиатуру, вызванную для конкретного объекта
        // textView.resignFirstResponder()
    }
    
 /*   @objc func updateTextView(notification: Notification) {
    
        guard let userInfo = notification.userInfo as? [String: AnyObject],
        let keyboardFrame = (userInfo[UIKeyboardFrameAndUserInfoKey] as? NSValue)?.cgRectValue
            else {return}
        
        if notification.Name == Notification.Name.UIKeyboardWillHide {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height - bottomConstraint.constant, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange )
    } */
    
    
    @IBAction func changeFontSize(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
}

extension TextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    // позволяет вводить определенное количество символов
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "Количество символов: \(textView.text.count)"
        
        let value = textView.text.count + (text.count - range.length)
    
        let alert = UIAlertController(title: "Упс...", message: "Можно ввести не более 80 символов", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
       
        if value > 80 {
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)}
        else {}
        
        return value <= 80
        
        
        
        
        
    }
    
}
