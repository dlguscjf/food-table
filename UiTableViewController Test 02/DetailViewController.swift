//
//  DetailViewController.swift
//  UiTableViewController Test 02
//
//  Created by 김종현 on 2018. 5. 28..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var local: UILabel!
    
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    var cellImage: String = ""
    var local1: String = ""
    var tel1: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cellImageView.image = UIImage(named: cellImage)
        tel.text = tel1
        local.text = local1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
