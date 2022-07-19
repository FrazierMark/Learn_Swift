//
//  RatingsInterfaceController.swift
//  PizzaAppWatchiOS WatchKit Extension
//
//  Created by Mark Frazier on 7/19/22.
//

import WatchKit
import Foundation


class RatingsInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var itemRatings: WKInterfaceLabel!
    
    @IBOutlet weak var itemDescription: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if let item = context as? MenuItem{
            itemDescription.setText(item.description)
            itemRatings.setText(String(repeating:"🍕", count:item.rating))
            setTitle(item.name)
        }
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
