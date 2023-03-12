//
//  ViewController.swift
//  Counter
//
//  Created by Вадим Шишков on 12.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    private var count = 0
    
    private var log: String = "История изменений:\n" {
        didSet {
            textView.text = log
        }
    }
    
    private var date: String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd HH:mm:ss")

        return dateFormatter.string(from: Date())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCounter()
        textView.isEditable = false
        textView.text = log
        valueLabel.font = UIFont(name: valueLabel.font.fontName, size: 30)
    }
    
    private func resetCounter() {
        count = 0
        valueLabel.text = "\(count)"
    }

    @IBAction func minusButtonPressed(_ sender: Any) {
        
        if count == 0 {
            log += "\(date.description): попытка уменьшить значение счётчика ниже 0\n"
            return
        } else if count == 1 {
            resetCounter()
            log += "\(date.description): значение изменено на -1\n"
            return
        }
        
        count -= 1
        valueLabel.text = "Значение счётчика: \(count)"
        log += "\(date.description): значение изменено на -1\n"
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        count += 1
        valueLabel.text = "Значение счётчика: \(count)"
        log += "\(date.description): значение изменено на +1\n"
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        resetCounter()
        log += "\(date.description): значение сброшено\n"
    }
}

