Linea_PhoneGap_Plugin V1.0
=====================

A Cordova Phonegap Plugin to interface Linea Barcode Scanner Attachments for iPhone / iPods 

## Author
Roger Pereira For Digital Dish Inc. (Northware ERP)

## Prerequisites
Cordova Phonegap for iOS
Linea Pro SDK

## Description
An Objective-C plugin developed in Xcode to interface Linea Pro barcode scanner devices with Cordova Phonegap. 

## How to use
- Copy the plugins folder to Xcode project
- Register the plugin to config.xml 
- Start using plugin using cordova.exec
- Ex. `cordova.exec(successCallback , errorCallback , 'CDVLinea', 'getBatteryCapacity', []);`

## Following features are supported:
- Check Connection State of the hardware attachment
- Check battery capacity of the hardware attachment
- Register call backs for successful barcode scans
