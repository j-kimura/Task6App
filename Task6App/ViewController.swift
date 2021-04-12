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

    private var answerValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        resetGame()
    }

    @IBAction private func checkAnswerButton(_ sender: Any) {
        let sliderValue = Int(answerSlider.value)

        let firstLine: String

        if answerValue == sliderValue {
            firstLine = "あたり!"
        } else {
            firstLine = "はずれ!"
        }

        presentAlert(message: "\(firstLine)\nあなたの値：\(sliderValue)")
    }

    private func resetGame() {
        answerValue = Int.random(in: 1...100)
        questionLabel.text = String(answerValue)
        answerSlider.value = 50
    }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        let nextQuestionAction = UIAlertAction(
            title: "再挑戦", style: .default, handler: { [weak self] _ in self?.resetGame()})
        alert.addAction(nextQuestionAction)

        present(alert, animated: true, completion: nil)
    }
}
