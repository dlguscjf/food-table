//
//  TotalMapViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_06 on 2018. 6. 11..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class TotalMapViewController: UIViewController {
  
    @IBOutlet weak var totalMapView: MKMapView!
    
    //주소배열
    var locations = [String]()
    var names = [String]()
    var annotations = [MKPointAnnotation]()
      var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMap(locations: locations, names: names)
        
        

        // Do any additional setup after loading the view.
    }
    func viewMap(locations:[String],names:[String]){
        
        for addr in locations {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr){
                (placemarks: [CLPlacemark]?, error : Error?) -> Void in
                if let myError = error{
                    print(myError)
                    return
                }
                if let myPlacemarks = placemarks{
                    let myPlacemark = myPlacemarks[0]
                    let loc = myPlacemark.location?.coordinate
                    
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    anno.title = names[self.count]
                    self.count = self.count + 1
                    anno.subtitle = addr
                    self.annotations.append(anno)
                    self.totalMapView.addAnnotations(self.annotations)
                    self.totalMapView.showAnnotations(self.annotations, animated: true)
                }
                else{
                    print("오류")
                }
            }
        }}
        
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
