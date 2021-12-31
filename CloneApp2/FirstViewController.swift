//
//  ViewController.swift
//  CloneApp2
//
//  Created by 서승우 on 2021/12/05.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Main", message: "메인화면 입니다.", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
}

