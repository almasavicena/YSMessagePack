//
//  ViewController.swift
//  YSMessagePack
//
//  Created by yuji on 05/24/2016.
//  Copyright (c) 2016 yuji. All rights reserved.
//

import UIKit
import YSMessagePack

struct MyDataStructure : Packable, CustomStringConvertible {
    var name: String
    var id: Int
    var boolVal: Bool
    
    var description: String {
        get {
            return "name: \(name)\nid: \(id)\nboolVal: \(boolVal)"
        }
    }
    
    func packFormat() -> [Packable] {
        // MessagePack only accept basic data structure,
        // therefore you need to define your own 'rule' on
        // how your data structure should be pack
        return [name, id, boolVal]
    }
    
    func msgtype() -> MsgPackTypes {
        return .Custom
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someString = "This is some string value"
        let someInteger = 1012312312312312
        let someDouble  = 1.231312312
        let someBool = true
        let myOwnDataStructure = MyDataStructure(name: "My Bug", id: 1, boolVal: true)
        // Now we want to pack them and send across
        // the `payload` is a NSData Object and you just
        // send them across
        let payload = pack(items: [someString, someInteger, someDouble, someBool, myOwnDataStructure])
        

        self.example_normal_unpack(payload)
       
        // uncomment to use any of the following 
        // unpacking methods
//        example_async_unpack(payload)
//        example_async_unapck_for_each(payload)
        
    }
    
    
    func example_normal_unpack(_ payload: NSData) {
        let unpack = try! payload.itemsUnpacked()
        
        // Now unpack our packed data
        // This will return an array of `NSData`,
        // And you need to cast them to the desire type
        let strUnpacked = unpack[0].castToString()
        let intUnpacked = unpack[1].castToInt
        let doubleUnpacked = unpack[2].castToDouble
        let boolUnpacked = unpack[3].castToBool
        
        let myUnpackedDataStructure // put our data structure together
            = MyDataStructure(name:     unpack[4].castToString()!,
                              id:       unpack[5].castToInt,
                              boolVal:  unpack[6].castToBool!)
        
        print(strUnpacked)
        print(intUnpacked)
        print(doubleUnpacked)
        print(boolUnpacked)
        print()
        print(myUnpackedDataStructure)
    }
    
    func example_async_unpack(payload: NSData) {
        // async (non-blocking) unpacking
        // useful when the payload is too big

        payload.unpackAsync(DISPATCH_QUEUE_PRIORITY_HIGH, competitionHandler: { (unpack) in
        
            let strUnpacked = unpack[0].castToString()
            let intUnpacked = unpack[1].castToInt
            let doubleUnpacked = unpack[2].castToDouble
            let boolUnpacked = unpack[3].castToBool
            
            let myUnpackedDataStructure // put our data structure together
                = MyDataStructure(name:     unpack[4].castToString()!,
                    id:       unpack[5].castToInt,
                    boolVal:  unpack[6].castToBool!)
            
            print(strUnpacked)
            print(intUnpacked)
            print(doubleUnpacked)
            print(boolUnpacked)
            print()
            print(myUnpackedDataStructure)
        })
    }
    
    func example_async_unapck_for_each(payload: NSData) {
        // similar lighter than example_async_unpack.
        // instead of calling the handler when finish
        // unpack the whole payload,
        // This handler will call whenever anyone of 
        // the member finished unpack
        payload.unpackAsyncForEach(DISPATCH_QUEUE_PRIORITY_HIGH) { (data, type, index) in
            switch type {
            case .str8bit, .str16bit, .str32bit, .fixstr:
                print("Fouond String \(data.castToString()!) at index \(index)")
            case .fixInt, .fixNegativeInt, .int8, .int16, .int32, .int64, .uInt8, .uInt16, .uInt32, .uInt64:
                print("Found Int \(data.castToInt) at index \(index)")
            case .float32, .float64:
                print("Found Float \(data.castToDouble) at index \(index)")
            case .bool:
                print("Found Bool \(data.castToBool) at index \(index)")
            default:
                break;
            }
        }
    }
    
}

