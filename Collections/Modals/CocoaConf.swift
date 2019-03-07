//
//  CocoaConf.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation
import UIKit

var kConferenceHeaderID = "ConferenceHeader"
var kConferenceHeaderSmallID = "ConferenceHeaderSmall"
var kSpeakerCellID = "SpeakerCell"
var kStarRatingFooterID = "StarRatingFooter"

class CocoaConf: NSObject {
    var conferences = [Conference]()
    
    static var all: CocoaConf = {
        var allCocoaConfs = CocoaConf(withConferences: [
            CocoaConf.sanJose2013(),
            CocoaConf.dallas2013(),
            CocoaConf.dc2013(),
            CocoaConf.chicago2013(),
            CocoaConf.raleigh2012(),
            CocoaConf.portland2012(),
            CocoaConf.columbus2012(),
            CocoaConf.dc2012(),
            CocoaConf.chicago2012(),
            CocoaConf.raleigh2011(),
            CocoaConf.columbus2011()
            ])
        return allCocoaConfs
    }()
    
    init(withConferences conferences: [Conference]) {
        self.conferences = conferences
    }
}

extension CocoaConf: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return conferences.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (0..<conferences.count).contains(section) {
            return conferences[section].speakers.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpeakerCollectionViewCell.className, for: indexPath) as! SpeakerCollectionViewCell
        
        let speaker = conferences[indexPath.section].speakers[indexPath.row]
        cell.nameLabel.text = speaker
        cell.speakerImageView.image = UIImage(named: speaker)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StarRatingFooter.className, for: indexPath)
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ConferenceHeader.className, for: indexPath) as! ConferenceHeader
        header.titleLabel.text = conferences[indexPath.item].name
        return header
    }
    
    class func columbus2011() -> Conference {
        return Conference(name: "CocoaConf Columbus 2011", start: Date.date(year: 2011, month: 8, day: 11), duration: 3, speakers: [
            "Chris Adamson",
            "Randy Beiter",
            "Craig Castelaz",
            "Mark Dalrymple",
            "Bill Dudney",
            "Mark Gilicinski",
            "Chris Judd",
            "Dave Koziol",
            "Mac Liaw",
            "Steve Madsen",
            "Jonathan Penn",
            "Doug Sjoquist",
            "Josh Smith",
            "Daniel Steinberg"
            ])
    }
    
    class func raleigh2011() -> Conference {
        return Conference(name: "CocoaConf Raleigh 2011", start: Date.date(year: 2011, month: 12, day: 1), duration: 3, speakers: [
            "Chris Adamson",
            "Jeff Biggus",
            "Collin Donnell",
            "Bill Dudney",
            "Nathan Eror",
            "Andy Hunt",
            "Andria Jensen",
            "Josh Johnson",
            "Chris Judd",
            "Saul Mora",
            "Jonathan Penn",
            "Jared Richardson",
            "Josh Smith",
            "Daniel Steinberg"
            ])
    }
    
    class func chicago2012() -> Conference {
        return Conference(name: "CocoaConf Chicago 2012", start: Date.date(year: 2012, month: 3, day: 15), duration: 3, speakers: [
            "Chris Adamson",
            "Randy Beiter",
            "Jeff Biggus",
            "Jonathan Blocksom",
            "Heath Borders",
            "Brian Coyner",
            "Bill Dudney",
            "Dave Koziol",
            "Brad Larson",
            "Eric Meyer",
            "Jonathan Penn",
            "Boisy Pitre",
            "Mark Pospesel",
            "Josh Smith",
            "Daniel Steinberg",
            "Whitney Young"
            ])
    }
    
    class func dc2012() -> Conference {
        return Conference(name: "CocoaConf DC 2012", start: Date.date(year: 2012, month: 6, day: 28), duration: 3, speakers: [
            "Chris Adamson",
            "Mike Ash",
            "Jonathan Blocksom",
            "Step Christopher",
            "Mark Dalrymple",
            "Jason Hunter",
            "Chris Judd",
            "Jonathan Lehr",
            "Scott McAlister",
            "Saul Mora",
            "Jonathan Penn",
            "Mark Pospesel",
            "Jonathan Saggau",
            "Chad Sellers",
            "David Smith",
            "Daniel Steinberg",
            "Walter Tyree",
            "Whitney Young"
            ])
    }
    
    class func columbus2012() -> Conference {
        return Conference(name: "CocoaConf Columbus 2012", start: Date.date(year: 2012, month: 9, day: 11), duration: 3, speakers: [
            "Josh Abernathy",
            "Chris Adamson",
            "Randy Beiter",
            "Brian Coyner",
            "Mark Dalrymple",
            "Bill Dudney",
            "Jason Felice",
            "Geoff Goetz",
            "Chris Judd",
            "Jeff Kelley",
            "Dave Koziol",
            "Steve Madsen",
            "Kevin Munc",
            "Jaimee Newberry",
            "Jonathan Penn",
            "Doug Sjoquist",
            "Josh Smith",
            "Daniel Steinberg",
            "Mattt Thompson"
            ])
    }
    
    class func portland2012() -> Conference {
        // reduces list for screenshots
        //return [Conference conferenceWithName:@"CocoaConf Portland 2012" startDate:[NSDate dateWithYear:2012 month:10 day:25] duration:3 speakers:@[@"Josh Abernathy", @"Tim Burks", @"James Dempsey", @"Collin Donnell", @"Andria Jensen", @"Justin Miller", @"Jaimee Newberry", @"Janine Ohmer", @"Elizabeth Taylor"]];
        return Conference(name: "CocoaConf Portland 2012", start: Date.date(year: 2012, month: 10, day: 25), duration: 3, speakers: [
            "Josh Abernathy",
            "Chris Adamson",
            "Tim Burks",
            "James Dempsey",
            "Collin Donnell",
            "Pete Hodgson",
            "Andria Jensen",
            "Justin Miller",
            "Saul Mora",
            "Jaimee Newberry",
            "Janine Ohmer",
            "Daniel Pasco",
            "Jonathan Penn",
            "Mark Pospesel",
            "Ben Scheirman",
            "Brent Simmons",
            "Josh Smith",
            "Daniel Steinberg",
            "Elizabeth Taylor",
            "Mattt Thompson"
            ])
    }
    
    class func raleigh2012() -> Conference {
        // reduces list for screenshots
        //return [Conference conferenceWithName:@"CocoaConf Raleigh 2012" startDate:[NSDate dateWithYear:2012 month:11 day:29] duration:3 speakers:@[@"Ameir Al-Zoubi", @"Ken Auer", @"Kevin Conner", @"Jack Cox", @"Josh Johnson", @"Scott McAlister", @"Rob Napier", @"Josh Nozzi", @"Jay Thrash", @"Walter Tyree"]];
        return Conference(name: "CocoaConf Raleigh 2012", start: Date.date(year: 2012, month: 11, day: 29), duration: 3, speakers: [
            "Chris Adamson",
            "Ameir Al-Zoubi",
            "Ken Auer",
            "Jonathan Blocksom",
            "Kevin Conner",
            "Jack Cox",
            "Mark Dalrymple",
            "Bill Dudney",
            "Aaron Hillegass",
            "Josh Johnson",
            "Chris Judd",
            "Scott McAlister",
            "Rob Napier",
            "Josh Nozzi",
            "Jonathan Penn",
            "Mark Pospesel",
            "Daniel Steinberg",
            "Jay Thrash",
            "Walter Tyree"
            ])
    }
    
    class func chicago2013() -> Conference {
        return Conference(name: "CocoaConf Chicago 2013", start: Date.date(year: 2013, month: 3, day: 7), duration: 3, speakers: [
            "Chris Adamson",
            "Brandon Alexander",
            "Randy Beiter",
            "Jeff Biggus",
            "James Dempsey",
            "Aaron Douglas",
            "Nathan Eror",
            "Chris Judd",
            "Peter Kananen",
            "Dave Koziol",
            "Ben Lachman",
            "Jaimee Newberry",
            "Jonathan Penn",
            "Charles Perry",
            "Boisy Pitre",
            "Ben Scheirman",
            "Josh Smith",
            "Daniel Steinberg",
            "Brittany Tarvin",
            "Elizabeth Taylor",
            "Josh Twist",
            "Whitney Young"
            ])
    }
    
    class func dc2013() -> Conference {
        // reduces list for screenshots
        //return [Conference conferenceWithName:@"CocoaConf DC 2013" startDate:[NSDate dateWithYear:2012 month:6 day:28] duration:3 speakers:@[@"Ken Auer", @"Jack Cox", @"Kevin Kim", @"Bob McCune", @"Rob Napier", @"Jaimee Newberry", @"Chris Risner", @"Chad Sellers", @"Doug Sjoquist", @"Walter Tyree", @"TJ Usiyan"]];
        return Conference(name: "CocoaConf DC 2013", start: Date.date(year: 2013, month: 3, day: 21), duration: 3, speakers: [
            "Chris Adamson",
            "Ken Auer",
            "Jonathan Blocksom",
            "Jack Cox",
            "Mark Dalrymple",
            "Bill Dudney",
            "Kevin Kim",
            "Jeff LaMarche",
            "Bob McCune",
            "Rob Napier",
            "Jaimee Newberry",
            "Mark Pospesel",
            "Chris Risner",
            "Chad Sellers",
            "Doug Sjoquist",
            "Daniel Steinberg",
            "Walter Tyree",
            "TJ Usiyan",
            "Ray Wenderlich"
            ])
    }
    
    //  Converted to Swift 4 by Swiftify v4.2.30733 - https://objectivec2swift.com/
    class func dallas2013() -> Conference {
        return Conference(name: "CocoaConf Dallas 2013", start: Date.date(year: 2013, month: 4, day: 4), duration: 3, speakers: [
            "Patrick Burleson",
            "Rene Cacheaux",
            "James Dempsey",
            "Bill Dudney",
            "Nathan Eror",
            "Kevin Harwood",
            "Kevin Kim",
            "Sean McMains",
            "Saul Mora",
            "Daniel Pasco",
            "Jonathan Penn",
            "Manton Reece",
            "Kyle Richter",
            "Cesare Rocchi",
            "Ben Scheirman",
            "Doug Sjoquist",
            "Daniel Steinberg",
            "Conrad Stoll",
            "Josh Twist",
            "Walter Tyree"
            ])
    }
    
    class func sanJose2013() -> Conference {
        // reduces list for screenshots
        //return [Conference conferenceWithName:@"CocoaConf San Jose 2013" startDate:[NSDate dateWithYear:2013 month:4 day:21] duration:3 speakers:@[@"Matt Drance", @"Bill Dudney", @"Bob McCune", @"Kyle Richter", @"Michael Simmons", @"Michele Titolo", @"Marcus Zarra", @"Daniel Pasco", @"Jaimee Newberry", @"James Dempsey"]];
        return Conference(name: "CocoaConf San Jose 2013", start: Date.date(year: 2013, month: 4, day: 21), duration: 3, speakers: [
            "Chris Adamson",
            "James Dempsey",
            "Matt Drance",
            "Bill Dudney",
            "Nathan Eror",
            "Mattieu Gamache-Asselin",
            "Pete Hodgson",
            "Jeff LaMarche",
            "Ben Lachman",
            "Bob McCune",
            "Saul Mora",
            "Jaimee Newberry",
            "Daniel Pasco",
            "Jonathan Penn",
            "Mark Pospesel",
            "Kyle Richter",
            "Michael Simmons",
            "Josh Smith",
            "Daniel Steinberg",
            "Elizabeth Taylor",
            "Michele Titolo",
            "Marcus Zarra"
            ])
    }
    
    // MARK: - Class Methods
    static var combinedCocoaConfs: CocoaConf = {
        let conf = Conference(name: "CocoaConf", start: Date.date(year: 2011, month: 8, day: 11), duration: 3, speakers: [
                "Josh Abernathy",
                "Chris Adamson",
                "Ameir Al-Zoubi",
                "Mike Ash",
                "Ken Auer",
                "Randy Beiter",
                "Jeff Biggus",
                "Jonathan Blocksom",
                "Heath Borders",
                "Tim Burks",
                "Craig Castelaz",
                "Step Christopher",
                "Kevin Conner",
                "Jack Cox",
                "Brian Coyner",
                "Mark Dalrymple",
                "James Dempsey",
                "Collin Donnell",
                "Bill Dudney",
                "Nathan Eror",
                "Jason Felice",
                "Mark Gilicinski",
                "Geoff Goetz",
                "Aaron Hillegass",
                "Pete Hodgson",
                "Andy Hunt",
                "Jason Hunter",
                "Andria Jensen",
                "Josh Johnson",
                "Chris Judd",
                "Jeff Kelley",
                "Dave Koziol",
                "Brad Larson",
                "Jonathan Lehr",
                "Mac Liaw",
                "Steve Madsen",
                "Scott McAlister",
                "Eric Meyer",
                "Justin Miller",
                "Saul Mora",
                "Kevin Munc",
                "Rob Napier",
                "Jaimee Newberry",
                "Josh Nozzi",
                "Janine Ohmer",
                "Daniel Pasco",
                "Jonathan Penn",
                "Boisy Pitre",
                "Mark Pospesel",
                "Jared Richardson",
                "Jonathan Saggau",
                "Ben Scheirman",
                "Chad Sellers",
                "Brent Simmons",
                "Doug Sjoquist",
                "Josh Smith",
                "David Smith",
                "Daniel Steinberg",
                "Elizabeth Taylor",
                "Mattt Thompson",
                "Jay Thrash",
                "Walter Tyree",
                "Whitney Young"
                ])
        var combinedCocoaConfs = CocoaConf(withConferences: [conf])
        return combinedCocoaConfs
    }() 
}
