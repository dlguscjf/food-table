
import UIKit

class MyTableViewController: UITableViewController {
    
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    var foodStoreThumbnail = ["01", "02", "03", "04", "05", "06"]
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 산19-8",
                            "부산광역시 부산진구 양정동 353-38"
                           ]
    var foodStoreTel = ["051-852-9969", "051-852-9969", "051-852-9969", "051-852-9969", "051-852-9969", "051-852-9969"]
    var foodMenus = ["수육백반,돼지국밥,순대국밥,내장국밥",
                     "짜장면,짬뽕,짬짜면,탕수육,탕짜면,군만두,양장피",
                     "떡볶이,떡강정,오뎅,핫도그,튀김",
                     "짜장면,짬뽕,짬짜면,탕수육,탕짜면,군만두,양장피",
                     "치킨마요,참치마요,돈불와퍼,돈치와퍼,돈까스카레",
                     "짜장면,짬뽕,짬짜면,탕수육,탕짜면,군만두,양장피",]

    override func viewDidLoad() {
        super.viewDidLoad()

   
        
        self.title = "DIT 배달통"
       
    }
    
    



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStoreNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
            as! FoodStoreTableViewCell
        // Configure the cell...
        
        cell.foodStoreCellName.text = foodStoreNames[indexPath.row]
        cell.foodStoreCellImage.image = UIImage(named: foodStoreThumbnail[indexPath.row])
        cell.foodStoreCellAddress.text = foodStoreAddress[indexPath.row]
        cell.foodStoreCellTel.text = foodStoreTel[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(foodStoreNames[indexPath.row])
        print(foodStoreTel[indexPath.row])
        
      
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                // 이름 넘기기
                destinationController.title = foodStoreNames[indexPath.row]
                
                // 이미지 넘기기
                destinationController.cellImage = foodStoreThumbnail[indexPath.row]
                
                destinationController.tel1 = foodStoreTel[indexPath.row]
                destinationController.local1 = foodStoreAddress[indexPath.row]
                destinationController.menu = foodMenus[indexPath.row]
            }
        }else if segue.identifier == "totalMap"{
            let destinationController = segue.destination as! TotalMapViewController
            destinationController.locations = foodStoreAddress
            destinationController.names = foodStoreNames
        }
    }
}
