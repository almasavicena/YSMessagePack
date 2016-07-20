//
//  NSDataCasters.swift
//  MessagePack2.0
//
//  Created by yuuji on 4/3/16.
//  Copyright © 2016 yuuji. All rights reserved.
//

import Foundation
import LinuxFoundation

#if swift(>=3)
    public extension Array {
        public init(count: Int, repeatedValue: Element) {
            self.init(repeating: repeatedValue, count: count)
        }
    }
#endif
//
//public extension NSMutableData {
//    ///Return the byte array of self
//    func byteArrayValue() -> ByteArray {
//        //buffer
//        var byte_array: ByteArray = ByteArray(count: self.length, repeatedValue: 0)
//        
//        //getBytes and put it into the buffer
//        self.getBytes(&byte_array, length: self.length)
//        return byte_array
//    }
//    
//    ///Get the byte array of self
//    var byteArray: [UInt8] {
//        var byte_array: [UInt8] = [UInt8](count: self.length, repeatedValue: 0)
//        //getBytes and put it into the buffer
//        self.getBytes(&byte_array, length: self.length)
//        return byte_array
//    }
//    
//    ///Cast data into Int value according to its byte_array value
//    var castToInt: Int {
//        var int_value: Int = 0
//        self.getBytes(&int_value, length: sizeof(Int.self))
//        
//        return int_value
//    }
//    
//    var castToUInt: Int {
//        var int_value: Int = 0
//        self.getBytes(&int_value, length: sizeof(Int.self))
//        return int_value
//    }
//    
//    ///Cast data into Int8 value according to its byte_array value
//    var castToInt8: Int8 {
//        var int_value: Int8 = 0
//        self.getBytes(&int_value, length: sizeof(Int8.self))
//        return int_value
//    }
//    
//    ///Cast data into Double value according to its byte_array value
//    var castToDouble: Double {
//        var double_value: Double = 0
//        self.getBytes(&double_value, length: sizeof(Double.self))
//        return double_value
//    }
//    
//    ///Cast data into Double value according to its byte_array value
//    var castTFloat: Float {
//        var double_value: Float = 0
//        self.getBytes(&double_value, length: sizeof(Float.self))
//        return double_value
//    }
//    
//    #if swift(>=3)
//    /**
//     Cast Data into String/NSString according to its byte_array value
//     - Parameter withEncoding: encoding to use, default is `ascii`
//     */
//    func castToString(withEncoding encoding: String.Encoding = .ascii) -> String? {
//        return String(data: Data(bytes: self.byteArray), encoding: encoding)
//    }
//    
//    #if !os(Linux) && !os(FreeBSD)
//    
//    ///Cast data into NSArray according to its byte_array value
//    var castToArray: [NSData]? {
//        let array = NSKeyedUnarchiver.unarchiveObject(with: Data(bytes: self.byteArray)) as? NSArray
//        return (array == nil) ? nil : array! as? [NSData]
//    }
//    
//    
//    ///Cast data into NSDictionary according to its byte_array value
//    var castToDictionary: NSDictionary? {
//        return NSKeyedUnarchiver.unarchiveObject(with: Data(bytes: self.byteArray)) as? NSDictionary
//    }
//    
//    #endif
//    
//    
//    func castToStringArray(withEncoding encoding: String.Encoding = .ascii) -> [String?] {
//        return self.castToArray!.map({($0).castToString(withEncoding: encoding)})
//    }
//    #else
//    /**
//     Cast Data into String/NSString according to its byte_array value
//     - Parameter withEncoding: encoding to use, default is `NSASCIIStringEncoding`
//     */
//    func castToString(withEncoding encoding: NSStringEncoding = NSASCIIStringEncoding) -> String? {
//    return NSString(data: self, encoding: encoding) as String?
//    }
//    
//    func castToStringArray(withEncoding encoding: NSStringEncoding = NSASCIIStringEncoding) -> [String?] {
//    return self.castToArray!.map({($0).castToString(withEncoding: encoding)})
//    }
//    
//    #if !os(Linux) && !os(FreeBSD)
//    
//    ///Cast data into NSArray according to its byte_array value
//    var castToArray: [NSData]? {
//    let array = NSKeyedUnarchiver.unarchiveObjectWithData(self) as? NSArray
//    return (array == nil) ? nil : array! as? [NSData]
//    }
//    
//    ///Cast data into NSDictionary according to its byte_array value
//    var castToDictionary: NSDictionary? {
//    return NSKeyedUnarchiver.unarchiveObjectWithData(self) as? NSDictionary
//    }
//    
//    #endif
//    
//    #endif
//    
//    var castToBool: Bool? {
//        #if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
//            return Bool(self.castToInt)
//        #else
//            return Bool(NSNumber(integerLiteral: self.castToInt))
//        #endif
//    }
//    
//    func mapUnpackedArray<T>(handler: (NSData) throws -> T) -> [T]{
//        return try! self.castToArray!.map(handler)
//    }
//    
//    public var castToUInt64: UInt64 {
//        var int_value: UInt64 = 0
//        self.getBytes(&int_value, length: sizeof(UInt64.self))
//        return int_value
//    }
//}

public extension NSData {
    
    ///Return the byte array of self
    func byteArrayValue() -> ByteArray {
        //buffer
        var byte_array: ByteArray = ByteArray(count: self.length, repeatedValue: 0)
        
        //getBytes and put it into the buffer
        self.getBytes(&byte_array, length: self.length)
        return byte_array
    }
    
    ///Get the byte array of self
    var byteArray: [UInt8] {
        var byte_array: [UInt8] = [UInt8](count: self.length, repeatedValue: 0)
        //getBytes and put it into the buffer
        self.getBytes(&byte_array, length: self.length)
        return byte_array
    }
    
    ///Cast data into Int value according to its byte_array value
    var castToInt: Int {
        var int_value: Int = 0
        self.getBytes(&int_value, length: sizeof(Int.self))
        
        return int_value
    }
    
    var castToUInt: Int {
        var int_value: Int = 0
        self.getBytes(&int_value, length: sizeof(Int.self))
        return int_value
    }
    
    ///Cast data into Int8 value according to its byte_array value
    var castToInt8: Int8 {
        var int_value: Int8 = 0
        self.getBytes(&int_value, length: sizeof(Int8.self))
        return int_value
    }
    
    ///Cast data into Double value according to its byte_array value
    var castToDouble: Double {
        var double_value: Double = 0
        self.getBytes(&double_value, length: sizeof(Double.self))
        return double_value
    }
    
    ///Cast data into Double value according to its byte_array value
    var castTFloat: Float {
        var double_value: Float = 0
        self.getBytes(&double_value, length: sizeof(Float.self))
        return double_value
    }
    
    #if swift(>=3)
    /**
     Cast Data into String/NSString according to its byte_array value
     - Parameter withEncoding: encoding to use, default is `ascii`
     */
    func castToString(withEncoding encoding: String.Encoding = .ascii) -> String? {
        return String(data: Data(bytes: self.byteArray), encoding: encoding)
    }
    
    #if !os(Linux) && !os(FreeBSD)
    
    ///Cast data into NSArray according to its byte_array value
    var castToArray: [NSData]? {
        let array = NSKeyedUnarchiver.unarchiveObject(with: Data(bytes: self.byteArray)) as? NSArray
        return (array == nil) ? nil : array! as? [NSData]
    }
    
    
    ///Cast data into NSDictionary according to its byte_array value
    var castToDictionary: NSDictionary? {
        return NSKeyedUnarchiver.unarchiveObject(with: Data(bytes: self.byteArray)) as? NSDictionary
    }
    
    func castToStringArray(withEncoding encoding: String.Encoding = .ascii) -> [String?] {
        return self.castToArray!.map({($0).castToString(withEncoding: encoding)})
    }
    
    #endif
    
    #else
    /**
     Cast Data into String/NSString according to its byte_array value
     - Parameter withEncoding: encoding to use, default is `NSASCIIStringEncoding`
     */
    func castToString(withEncoding encoding: NSStringEncoding = NSASCIIStringEncoding) -> String? {
        return NSString(data: self, encoding: encoding) as String?
    }
    
    func castToStringArray(withEncoding encoding: NSStringEncoding = NSASCIIStringEncoding) -> [String?] {
        return self.castToArray!.map({($0).castToString(withEncoding: encoding)})
    }
    
    #if !os(Linux) && !os(FreeBSD)
    
    ///Cast data into NSArray according to its byte_array value
    var castToArray: [NSData]? {
        let array = NSKeyedUnarchiver.unarchiveObjectWithData(self) as? NSArray
        return (array == nil) ? nil : array! as? [NSData]
    }
    
    ///Cast data into NSDictionary according to its byte_array value
    var castToDictionary: NSDictionary? {
        return NSKeyedUnarchiver.unarchiveObjectWithData(self) as? NSDictionary
    }
    
    #endif
    
    #endif

    var castToBool: Bool? {
        #if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
        return Bool(self.castToInt)
        #else
        return Bool(NSNumber(integerLiteral: self.castToInt))
        #endif
    }
    
    func mapUnpackedArray<T>(handler: (NSData) throws -> T) -> [T]{
        return try! self.castToArray!.map(handler)
    }
    
    public var castToUInt64: UInt64 {
        var int_value: UInt64 = 0
        self.getBytes(&int_value, length: sizeof(UInt64.self))
        return int_value
    }
    
}
