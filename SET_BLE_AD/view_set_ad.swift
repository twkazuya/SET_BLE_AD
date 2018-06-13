import UIKit
import CoreBluetooth

class view_set_ad: UIViewController,CBCentralManagerDelegate, CBPeripheralDelegate {
    var cust_ID : UInt16 = 0x0000
    var cust_ID1 : UInt8 = 0x00
    var cust_ID2 : UInt8 = 0x00
    var item_ID : UInt16 = 0x0000
    var item_ID1 : UInt8 = 0x00
    var item_ID2 : UInt8 = 0x00
    var cat_ID : UInt8 = 0x00
    var device_name = ""
    var series = ""
    var sts = ""
    
    var myCentralManager:CBCentralManager!
    var ps:[CBPeripheral] = []
    
    @IBOutlet weak var LB1: UILabel!
    @IBOutlet weak var LB2: UILabel!
    @IBOutlet weak var LB3: UILabel!
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if (central.state == .poweredOn)
        {
            myCentralManager.scanForPeripherals(withServices: [CBUUID(string:"0000E0FF-3C17-D293-8E48-14FE2E4DA212")], options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
            
            //            myCentralManager.scanForPeripherals(withServices: [CBUUID(string:"180A")], options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
            //            myCentralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.isIdleTimerDisabled = true
        myCentralManager = CBCentralManager()
        myCentralManager.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        
        guard let rawData = advertisementData["kCBAdvDataManufacturerData"] as? Data
            
            else{
                return
        }
        
        if rawData.count > 0{
            let len:Int = (rawData.count)
            for i in 0 ... len - 1 {
                print(String(format:"raw[%d]=%02x\r\n",i,rawData[i]))
            }
            
        }
        //To check legal device by custom ID.
        let deviceModel:UInt16 = (UInt16(rawData[2]) << 8) | UInt16(rawData[3] & 0x00FF)
        let deviceCategory:UInt8 = rawData[4]
        let customID:UInt16 = (UInt16(rawData[5]) << 8) | UInt16(rawData[6] & 0x00FF)
        let devicerReserved:UInt8 = rawData[7]
        
        //print("customID =\(AdvertisingData.CUSTOM_IDs[customID]!)\r\n")
        //print("customID APP=\(Config.CustomID)\r\n")
        guard let customStr = AdvertisingData.CUSTOM_IDs[customID]
            else{
                return
        }
        
        //        guard let deviceModelStr = AdvertisingData.dev_Model[deviceModel]
        //            else{
        //                return
        //        }
        //        if !deviceModelStr.contains(Config.deviceSeries){
        //            return
        //
        //        }
        
        //        guard let deviceColorStr = AdvertisingData.dev_Color[deviceColor] as? String
        //            else{
        //                return
        //        }
        
        //        guard let deviceCategoryStr = AdvertisingData.dev_Category[deviceCategory]
        //            else{
        //                return
        //        }
        
        
        //        if Config.CustomID !=  customStr{
        //
        //            return
        //        }
        
        
        
        guard let name: String = advertisementData["kCBAdvDataLocalName"] as? String
            
            else{
                print("name= nil")
                return
        }
        
        let uuid: UUID = peripheral.identifier
        
        //                if customID != 0xFFFE
        //                {
        //                    LB1.text = peripheral.name
        //                    LB2.text = "\(RSSI)"
        //                    //        print("\(String(describing: peripheral.name))    \(RSSI)")
        //                    ps.removeAll()
        //                    ps.append(peripheral)
        //                    myCentralManager.connect(ps[0], options: nil)
        //                }
        
        
        
        
        
        
        
        
        
        if !(Int(truncating: RSSI) >= -60 && Int(truncating: RSSI) <= 0)
        {
            
            if ps.count > 0
            {
                if ps[0].identifier.uuidString == uuid.uuidString
                {
                    LB1.text = ""
                    LB2.text = ""
                    LB3.text = ""
                }
            }
            
            return
            
        }
        else
        {
            LB1.text = customStr
            LB2.text = name
            LB3.text = "\(RSSI)"
            //        print("\(String(describing: peripheral.name))    \(RSSI)")
            
            ps.removeAll()
            ps.append(peripheral)
        }
        
        
        
        
        
        
        if self.series == "E5"
        {
        if (customID != self.cust_ID || deviceModel != self.item_ID || name != self.device_name)
        {
            if self.ps[0].state == CBPeripheralState.disconnected
            {
                myCentralManager.connect(ps[0], options: nil)
                return
            }
        }
        }
        
        
        
        
        if self.series == "E3"
        {
            if (name != device_name)
            {
                if ps[0].state == CBPeripheralState.disconnected
                {
                    self.sts = "set_name"
                    myCentralManager.connect(ps[0], options: nil)
                    return
                }
            }
            
            if (customID != self.cust_ID || deviceModel != self.item_ID)
            {
                if ps[0].state == CBPeripheralState.disconnected
                {
                    self.sts = "set_ad"
                    myCentralManager.connect(ps[0], options: nil)
                    return
                }
            }
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("connected")
        
        //        delayOnMainQueue(delay: 0.1, closure: {
        //            peripheral.delegate = self
        //            peripheral.discoverServices([CBUUID(string:Config.serviceUUID)])
        //
        //        })
        peripheral.delegate = self
        peripheral.discoverServices([CBUUID(string:Config.serviceUUID)])
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if error != nil {
            print("Error discovering services: \(error?.localizedDescription)")
            
            // dismiss(animated: true, completion: nil)
            return
        }
        print("SSSSSSSSSSSSSSSS")
        peripheral.delegate = self
        if let services = peripheral.services {
            
            for service in services {
                
                print("SSSSSSSSSSS: \(service)")
                if service.uuid == CBUUID(string:Config.serviceUUID){
                    delayOnMainQueue(delay: 0.1, closure: {
                        
                        peripheral.delegate = self
                        //                        peripheral.discoverCharacteristics([CBUUID(string:Config.charUUID)], for: service)
                        peripheral.discoverCharacteristics(nil, for: service)
                        
                    })
                    
                    
                    
                }
            }
        }
    }
    
    
    
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        let characteristic = service.characteristics?[0]
        
        print("WWWWWWWWWWWWWWWWWWWWWWWWWWW")
        print("UUID=\(characteristic?.uuid.uuidString)")
        
        
        if series == "E5"
        {
        var newName = device_name
        delayOnMainQueue(delay: 0.1, closure: {
            let length = newName.utf8.count
            
            if newName.utf8.count > 16{
                
                repeat{
                    var chars = newName.characters
                    chars.removeLast()
                    newName = String(chars)
                }while newName.utf8.count > 16
            }
            
            
            /*while newName.utf8.count < 16{
             newName = newName + " "
             }*/
            
            let nameUint8 = Util.StringtoUINT8(data: newName, len: 16, fillData: BPprotocol.nullData)
            
            //Array(newName.utf8)//utf8Name.map{ UInt8($0.value) }
            
            let cmd = Config.bpProtocol.setDeviceName(deviceName:nameUint8, nameLen: newName.utf8.count)
            peripheral.setNotifyValue(true, for: characteristic!)
            peripheral.delegate = self
            peripheral.writeValue(cmd, for: characteristic!, type: .withResponse)
            
        })
        
        
        
        
        
        delayOnMainQueue(delay: 0.1, closure: {
            let cmd = Config.bpProtocol.setAdvertisingData(AD: [0x5D,0x00,self.item_ID1,self.item_ID2,self.cat_ID,self.cust_ID1,self.cust_ID2,0x00])
            peripheral.delegate = self
            peripheral.writeValue(cmd, for: characteristic!, type: .withResponse)
            
        })
        }
            
            
            
            
            
            
            
            
        
        
        
        
        if series == "E3" && sts == "set_name"
        {
            var newName = device_name
            delayOnMainQueue(delay: 0.1, closure: {
                
                let length = newName.utf8.count

                if newName.utf8.count > 16{

                    repeat{
                        var chars = newName.characters
                        chars.removeLast()
                        newName = String(chars)
                    }while newName.utf8.count > 16
                }


                /*while newName.utf8.count < 16{
                 newName = newName + " "
                 }*/

                let nameUint8 = Util.StringtoUINT8(data: newName, len: 16, fillData: BPprotocol.nullData)

                //Array(newName.utf8)//utf8Name.map{ UInt8($0.value) }

                let cmd = Config.bpProtocol.setDeviceNameE3(deviceName:nameUint8, nameLen: newName.utf8.count)
                peripheral.setNotifyValue(true, for: characteristic!)
                peripheral.delegate = self
                peripheral.writeValue(cmd, for: characteristic!, type: .withResponse)

            })
            
            
            
            
            
            
        
        }
        
        
        
        
        
        
        
        
        
        
        if series == "E3" && sts == "set_ad"
        {
            delayOnMainQueue(delay: 0.1, closure: {
                let cmd = Config.bpProtocol.setAdvertisingData(AD: [0x5D,0x00,self.item_ID1,self.item_ID2,self.cat_ID,self.cust_ID1,self.cust_ID2,0x00])
                peripheral.setNotifyValue(true, for: characteristic!)
                peripheral.delegate = self
                peripheral.writeValue(cmd, for: characteristic!, type: .withResponse)
                
            })

        }
        
        
            
        
        
        
    }
    
    
    
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
//        if error != nil
//        {
//            return
//        }
        
//        self.myCentralManager.cancelPeripheralConnection(peripheral)
        
        if self.series == "E3" && peripheral.state != CBPeripheralState.disconnected
        {
            
            self.myCentralManager.cancelPeripheralConnection(peripheral)
//            delayOnMainQueue(delay: 2.0, closure: {
//                peripheral.delegate = self
//                self.myCentralManager.cancelPeripheralConnection(peripheral)
//                print("UPUPUPUPUPUPUPUP")
//            })
        }
        
        
        
        
    }
    
    
    
    
    
    
    func delayOnMainQueue(delay: Double, closure: @escaping ()->()) {
        
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: closure)
    }
    
    
    
    
    
    
    @IBAction func bt_close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}

