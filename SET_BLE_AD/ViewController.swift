//
//  ViewController.swift
//  SET_BLE_AD
//
//  Created by twkazuya on 2018/3/1.
//  Copyright © 2018年 ANXELL. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var my_scrolview: UIScrollView!
    
    @IBOutlet weak var my_view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        my_scrolview.delegate = self
//        my_scrolview.addSubview(my_view)

        my_scrolview.contentSize = my_view.bounds.size
        
        my_scrolview.canCancelContentTouches = true
        my_scrolview.delaysContentTouches = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func bt_anxell_e5ar(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x000D
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0D
        vc.cat_ID = 0x02
        vc.device_name = "E5AR"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func bt_anxell_e5ak(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x000E
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0E
        vc.cat_ID = 0x03
        vc.device_name = "E5AK"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func bt_gem_easiprox(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFE
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFE
        vc.item_ID = 0x000D
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0D
        vc.cat_ID = 0x02
        vc.device_name = "Easiprox⁺"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func bt_gem_dg_800(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFE
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFE
        vc.item_ID = 0x000E
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0E
        vc.cat_ID = 0x03
        vc.device_name = "DG-800⁺"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func bt_anxell_e3ak(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0003
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x03
        vc.cat_ID = 0x01
        vc.device_name = "E3AK"
        vc.series = "E3"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_e3a2(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0000
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x00
        vc.cat_ID = 0x00
        vc.device_name = "E3A2"
        vc.series = "E3"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_e5ar2(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x000F
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0F
        vc.cat_ID = 0x02
        vc.device_name = "E5AR2"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_e5ak2(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0010
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x10
        vc.cat_ID = 0x03
        vc.device_name = "E5AK2"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func bt_gem_easiprox_slim(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFE
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFE
        vc.item_ID = 0x000F
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0F
        vc.cat_ID = 0x02
        vc.device_name = "Easi⁺ Slim"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_gem_dg_160(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFE
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFE
        vc.item_ID = 0x0010
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x10
        vc.cat_ID = 0x03
        vc.device_name = "DG-160⁺"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func bt_rofu_bc_5900b(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0x0001
        vc.cust_ID1 = 0x00
        vc.cust_ID2 = 0x01
        vc.item_ID = 0x000D
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0D
        vc.cat_ID = 0x02
        vc.device_name = "BC-5900B"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func bt_rofu_bkc_5000b(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0x0001
        vc.cust_ID1 = 0x00
        vc.cust_ID2 = 0x01
        vc.item_ID = 0x000E
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x0E
        vc.cat_ID = 0x03
        vc.device_name = "BKC-5000B"
        vc.series = "E5"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_e3ak7(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0011
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x11
        vc.cat_ID = 0x01
        vc.device_name = "E3AK7"
        vc.series = "E3"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_e3ak8(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0012
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x12
        vc.cat_ID = 0x01
        vc.device_name = "E3AK8"
        vc.series = "E3"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_anxell_pbt_1000bt(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "view_set_ad") as! view_set_ad
        
        vc.cust_ID = 0xFFFF
        vc.cust_ID1 = 0xFF
        vc.cust_ID2 = 0xFF
        vc.item_ID = 0x0013
        vc.item_ID1 = 0x00
        vc.item_ID2 = 0x13
        vc.cat_ID = 0x00
        vc.device_name = "PBT-1000BT"
        vc.series = "E3"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
}

