//
//  Event.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 03/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

enum Campus : String  {
    case paris = "Paris"
    case aixEnProvence = "Aix-en-Provence"
    case nantes = "Nantes"
    case bordeaux = "Bordeaux"
    case lyon = "Lyon"
    case toulouse = "Toulouse"
    case other = "Other"
    case null
}

// to do complete all list
enum Cursus : String {
    case manaa = "MANAA"
    case limart = "Limart"
    case ingesup = "Ingesup"
    case isee = "ISEE"
    case cpMultimedia = "CP Multimedia"
    case other = "Other"
    case null
}

enum Duration : String {
    case halfDay    = "1/2 journée"
    case day        = "1 journée"
    case twoDays    = "2 jours"
    case threeDays  = "3 jours"
    case oneWeek    = "1 semaine"
    case null
}

enum YnovReason : String {
    case JPO    = "JPO"
    case DayInfos = "Journée d'informations"
    case ImmersiveSession = "Session d'immersion"
    case other = "Autre"
    case null
}


class Event: NSObject {
    
    var location : String
    var reason : String
    var cursus : [Cursus]
    var campus : [Campus]
    var beginningDate : Date
    var duration : Duration
    var ynovReason : YnovReason
    
    
    public init(location: String , reason: String, cursus: [Cursus], campus: [Campus], begin: Date, duration: Duration, isYnov: YnovReason) {
        self.location = location
        self.reason = reason
        self.cursus = cursus
        self.campus = campus
        self.beginningDate = begin
        self.duration = duration
        self.ynovReason = isYnov
    }
    
    
}
