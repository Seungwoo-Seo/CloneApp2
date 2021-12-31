//
//  OrderViewController.swift
//  CloneApp2
//
//  Created by 서승우 on 2021/12/07.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let korList: [String] = ["리저브 드립", "콜드 브루", "프라푸치노", "블렌디드", "피지오", "티바나"]
    let engList: [String] = ["Reserve Drip", "Cold Brew", "Frappuccino", "Blended", "Fizzio", "Teavana"]
    let imgList: [String] = ["menu1", "menu2", "menu3", "menu4", "menu5", "menu6"]
    let priceList: [Int] = [7000, 7500, 6500, 8000, 4900, 6000]
    
    
    //segue가 실행되기 직전에 준비할 내용 작성 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에 데이터 전달
        if segue.identifier == "showDetail" {
            //segue.destination -> showDetail segue가 지칭하고 있는 뷰 컨트롤러
            if let vc = segue.destination as? DetailViewController, let index = sender as? Int {
                vc.menuName = korList[index]
                vc.menuImg = imgList[index]
                vc.menuPrice = priceList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //UITableViewDataSoure
    
    //셀을 몇 개 보여줘?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return korList.count
    }
    
    //셀을 어떻게 보여줘?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(imgList[indexPath.row]).jpeg")
        
        cell.imgView.image = img
        cell.korLabel.text = korList[indexPath.row]
        cell.engLabel.text = engList[indexPath.row]
        
        return cell
    }
    
    //UITableViewDelegate
    
    //셀을 눌렀을 때 어떻게 해줘?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //해당 segue를 실행
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
}

//셀 커스텀
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var korLabel: UILabel!
    @IBOutlet weak var engLabel: UILabel!
    
    
}
