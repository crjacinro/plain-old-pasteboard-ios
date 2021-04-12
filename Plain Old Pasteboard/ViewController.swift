//
//  ViewController.swift
//  Plain Old Pasteboard
//
//  Created by Serge Villasica on 12/4/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    let DATA_KEY = "data_key"
    var pastedStrings : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText()
    }
    
    func addText() {
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()
    }
    
    func showText() {
        textView.text = ""
        
        for str in pastedStrings {
            textView.text.append("\(str)\n\n")
        }
    }
    
    @IBAction func onTrashPressed(_ sender: Any) {
        pastedStrings.removeAll()
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
}
