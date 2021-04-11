//
//  ViewController.swift
//  Task6App
//
//  Created by Jui Kimura on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerSlider: UISlider!
    private var currentValue: String = "50"

    override func viewDidLoad() {
        super.viewDidLoad()

        restartGame()
        self.currentValue = "\(Int(answerSlider.value))"
    }

    @IBAction private func changeSlider(_ sender: Any) {
        self.currentValue = "\(Int(self.answerSlider.value))"
    }

    @IBAction private func checkAnswerButton(_ sender: Any) {
        guard questionLabel.text == self.currentValue else {
            presentAlert(message: "はずれ!\nあなたの値：\(self.currentValue)")
            return
        }
        presentAlert(message: "あたり!\nあなたの値：\(self.currentValue)")
    }

    private func restartGame() {
        self.questionLabel.text = "\(Int.random(in: 0...100))"
        answerSlider.value = 50
        }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        let nextQuestionAction = UIAlertAction(
            title: "再挑戦", style: .default, handler: { (_ : UIAlertAction!) -> Void in self.restartGame()})
        alert.addAction(nextQuestionAction)

        present(alert, animated: true, completion: nil)
    }
}
