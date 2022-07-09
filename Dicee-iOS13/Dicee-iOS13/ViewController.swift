

import UIKit

class ViewController: UIViewController {

    // Interface builder outlet (a way to access/reference this particular UI element)
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
   
    
    // Block of code runs when app is loaded
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    // Interface Builder Action/Function
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let diceArray = [
            UIImage(named: "DiceOne"),
            UIImage(named: "DiceTwo"),
            UIImage(named: "DiceThree"),
            UIImage(named: "DiceFour"),
            UIImage(named: "DiceFive"),
            UIImage(named: "DiceSix")
        ]
        // let randomDiceNum = [Int.random(in: 0...5)]
        
        diceImageView1.image = diceArray.randomElement()!!
        
        diceImageView2.image = diceArray.randomElement()!!
        
        // another way to write it
        // diceImageView2.image = dictArray[Int.random(in: 0...5)]
    }
}

