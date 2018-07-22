//
//  HelperFile.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import Foundation
import MapKit
var country:[String : Any] = ["Name":"","Code":"","Image":AnyObject.self]
var Countries = [country]
var flag:String!
var Usercode:String!
var Usercountry:String!
var mobnum:String!
var verification_id:String!
var KEY_UID=""
var m_latitude:CLLocationDegrees!
var m_longitude:CLLocationDegrees!
var locationmanager = CLLocationManager()
let directionUrl = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=Vancouver+BC|Seattle&destinations=San+Francisco|Victoria+BC&mode=bicycling&language=en-EN"
