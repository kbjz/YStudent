//
//  EventManager.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 15/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class EventManager: NSObject {
    
    //Count enum
  
    
    
    static let sharedInstance = EventManager()
    var listOfEvents = [Event]()
    var selectedEvent : Event?
    var listOfCampus = [Campus.toulouse,Campus.aixEnProvence,Campus.bordeaux,Campus.lyon,Campus.nantes,Campus.paris,Campus.other]
    var listOfCursus = [Cursus.cpMultimedia,Cursus.ingesup,Cursus.isee,Cursus.limart,Cursus.manaa,Cursus.other]
    var listOfDuration = [Duration.halfDay,Duration.day,Duration.twoDays,Duration.threeDays,Duration.oneWeek]
    var listOfYnovReason = [YnovReason.JPO,YnovReason.ImmersiveSession,YnovReason.DayInfos,YnovReason.other]
    
    var durationSelected = Duration.null
    var campusSelected = [Campus]()
    var cursusSelected = [Cursus]()
    
    func addEvent(e: Event) {
        self.listOfEvents.append(e)
    }
    
    
}
