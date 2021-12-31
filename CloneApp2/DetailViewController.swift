//
//  DetailViewController.swift
//  CloneApp2
//
//  Created by 서승우 on 2021/12/07.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    
    var menuName: String?
    var menuImg: String?
    var menuPrice: Int?
    var countingPrice: Int?
    var nowPrice: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func sizeSeg(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if let sum = countingPrice {
                priceLabel.text = "\(sum)"
                nowPrice! = sum
            }
        case 1:
            if let sum = countingPrice {
                priceLabel.text = "\(sum+500)"
                nowPrice! = sum
            }
        case 2:
            if let sum = countingPrice {
                priceLabel.text = "\(sum+1000)"
                nowPrice! = sum
            }
        default:
            if let sum = countingPrice {
                priceLabel.text = "\(sum)"
                nowPrice! = sum
            }
        }
    }
    
    @IBAction func step(_ sender: UIStepper) {
        countLabel.text = "\(Int(sender.value))"
        priceLabel.text = "\(nowPrice! * Int(sender.value))"
    }
    
    
    
    //DetailView ui 초기화
    func updateUI() {
        if let name = self.menuName, let img = self.menuImg, let price = self.menuPrice {
            let img = UIImage(named: "\(img).jpeg")
            imgView.image = img
            menuLabel.text = name
            priceLabel.text = "\(price)"
            countingPrice = price
        }
    }
   
}
