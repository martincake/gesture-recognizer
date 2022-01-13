//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Артём Шилоносов on 05.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeObservers()
        tapObservers()
    }
    
    // метод наблюдателя за свайпами
    func swipeObservers() {
        
        // создаем экземпляр класса UISwipeGestureRecognizer, который
        // следит за свайпом слева направо
        let swipeRight = UISwipeGestureRecognizer(
            target: self,                       // отслеживаем свайпы в этом классе
            action: #selector(handleSwipes))    // передаем селектор, через который будем вызывать метод, в котором определим логику для этого свайпа
        // задаем направление свайпа
        swipeRight.direction = .right
        // вызываем наблюдателя на нашем View Controller
        self.view.addGestureRecognizer(swipeRight)
        
        // аналогичным образом создаем наблюдателя за свайпом налево
        let swipeLeft = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        // аналогичным образом создаем наблюдателя за свайпом вниз
        let swipeDown = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        // аналогичным образом создаем наблюдателя за свайпом вверх
        let swipeUp = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    // метод наблюдателя за тапами
    func tapObservers() {
        
        // создаем экземпляр класса UITapGestureRecognizer, который
        // следит за тройным тапом
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        // задаем количество отслеживаемых тапов
        tripleTap.numberOfTapsRequired = 3
        // вызываем наблюдателя на нашем View
        self.view.addGestureRecognizer(tripleTap)
        
        // аналогичным образом создаем наблюдателя за двойным тапом
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        // ВАЖНО: игнорируем двойной тап, если тапаем трижды
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .right: label.text = "Right swipe was recognized"
        case .left: label.text = "Left swipe was recognized"
        case .down: label.text = "Down swipe was recognized"
        case .up: label.text = "Up swipe was recognized"
        default: break
        }
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple tap was recognized"
    }
    
    @objc func doubleTapAction() {
        label.text = "Double tap was recognized"
    }
}

