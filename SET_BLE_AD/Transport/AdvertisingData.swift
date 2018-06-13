//
//  File.swift
//  E3AK
//
//  Created by BluePacket on 2018/1/19.
//  Copyright © 2018年 com.E3AK. All rights reserved.
//

import Foundation

class AdvertisingData{
    //Custom ID list
    public static let CUSTOM_IDs:[UInt16:String] = [
        0x0000:"custom1"
        ,0x0001:"ROFU"
        ,0xFFFE:"GEM"
        ,0xFFFF:"ANXELL"
        
    ]
    //Device Model list
    public static let dev_Model:[UInt16:String] = [
        0x0000:"E3A2-14"
        ,0x0001:"E3A2-14A"
        ,0x0002:"E3AK1-14"
        ,0x0003:"E3AK1-14A"
        ,0x0004:"E3AK2-14"
        ,0x0005:"E3AK2-14A"
        ,0x0006:"E3AK3-14"
        ,0x0007:"E3AK3-14A"
        ,0x0008:"E3AK4-14"
        ,0x0009:"E3AK4-14A"
        ,0x000A:"E3AK5"
        ,0x000B:"E3AK6"
        ,0x000C:"E3AK6-WI"
        ,0x000D:"E5AR"
        ,0x000E:"E5AK"
        ,0x000F:"E5AR2"
        ,0x0010:"E5AK2"
        ,0x0011:"E3AK7"
        ,0x0012:"E3AK8"
        ,0x0013:"PBT-1000BT"
        ,0xFFFF:"xxxxxxxx"
    ]
    
    //Device Category list
    public static let dev_Category:[UInt8:String] = [
        0x00:"Reader"
        ,0x01:"Keypad"
        ,0x02:"Reader(EM)"
        ,0x03:"Keypad(EM)"
        ,0x04:"Reader(Mifare)"
        ,0x05:"Keypad(Mifare)"
        ,0x06:"TouchPanel"
        ,0x07:"Keypad(EM)+TouchPanel"
        ,0x08:"Reader(Mifare)+TouchPanel"]
    
    //Device Color list
    //    public static let dev_Color:[UInt16:String] = [
    //         0x0000:"E3A2-14"
    //        ,0x0001:"E3A2-14A"
    //        ,0x0002:"E3AK1-14"
    //        ,0x0003:"E3AK1-14A"
    //        ,0x0004:"E3AK2-14"
    //        ,0x0005:"E3AK2-14A"
    //        ,0x0006:"E3AK3-14"
    //        ,0x0007:"E3AK3-14A"
    //        ,0x0008:"E3AK4-14"
    //        ,0x0009:"E3AK4-14A"
    //        ,0x000A:"E3AK5"
    //        ,0x000B:"E3AK6"
    //        ,0x000C:"E3AK6-WI"
    //        ,0x000D:"E5AR"
    //        ,0x000E:"E5AK"
    //        ,0x0AC0:"xxxxxxxx"
    //        ]
    
    public static let dev_Reserved:[UInt8:String] = [
        0x00:"xxxx"
        ,0x01:"xxxx"
        ,0xFF:"xxxx"
        
    ]
    
    
    
    
}


