//
//  QuizTestTableViewCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

protocol BinanceProtocolTest: AnyObject {
    func didAnswerQuestion(correctAnswers: Int)
}

final class QuizTestTableViewCell: UITableViewCell {
    
    weak var delegate: BinanceProtocolTest?
    weak var quizViewController: QuizTestViewController?
    
    static let reuseID = String(describing: QuizTestTableViewCell.self)
    var quizBrain = GraphicsQuiz()
    private var answerSelected = false
    var userCorrectAnswers = 0
    weak var navigationController: UINavigationController?
    
    // MARK: - UI
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = R.font.ibmPlexSansMedium(size: 32)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("1 answer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = R.font.ibmPlexSansMedium(size: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 20
        button.backgroundColor = R.color.colorTextField()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("2 answer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = R.font.ibmPlexSansMedium(size: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 20
        button.backgroundColor = R.color.colorTextField()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("3 answer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = R.font.ibmPlexSansMedium(size: 16)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 20
        button.backgroundColor = R.color.colorTextField()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cardCountLabel: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = R.color.settingsLineColor()
        uiView.layer.cornerRadius = 10
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1/5"
        label.textColor = .white
        label.font = R.font.ibmPlexSansMedium(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(questionLabel)
        contentView.addSubview(firstAnswerButton)
        contentView.addSubview(secondAnswerButton)
        contentView.addSubview(thirdAnswerButton)
        contentView.addSubview(cardCountLabel)
        contentView.addSubview(countLabel)
        
        firstAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        thirdAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        constraintsSetup()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cardCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            cardCountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cardCountLabel.heightAnchor.constraint(equalToConstant: 40),
            cardCountLabel.widthAnchor.constraint(equalToConstant: 90),
            
            countLabel.centerXAnchor.constraint(equalTo: cardCountLabel.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: cardCountLabel.centerYAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: cardCountLabel.bottomAnchor, constant: 24),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            firstAnswerButton.bottomAnchor.constraint(equalTo: secondAnswerButton.topAnchor, constant: -16),
            firstAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            firstAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            firstAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
            secondAnswerButton.bottomAnchor.constraint(equalTo: thirdAnswerButton.topAnchor, constant: -16),
            secondAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            secondAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            secondAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
            thirdAnswerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            thirdAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thirdAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            thirdAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
    // MARK: - Actions
    
    @objc private func quitQuizButtonTapped() {
        if quizBrain.questionNumber > 0 {
            quizBrain.prevQuestion()
            updateUI()
        }
    }
    
    @objc public func updateUI() {
        let questionText = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        questionLabel.text = questionText
        firstAnswerButton.setTitle(answers[0], for: .normal)
        secondAnswerButton.setTitle(answers[1], for: .normal)
        thirdAnswerButton.setTitle(answers[2], for: .normal)
        
        countLabel.text = "\(quizBrain.questionNumber + 1)/\(quizBrain.quiz.count)"
        
        firstAnswerButton.backgroundColor = R.color.colorTextField()
        secondAnswerButton.backgroundColor = R.color.colorTextField()
        thirdAnswerButton.backgroundColor = R.color.colorTextField()
        
        answerSelected = false
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = R.color.tabBarTint()
                userCorrectAnswers += 1
            } else {
                sender.backgroundColor = .red
            }
            
            sender.layer.cornerRadius = 20
            answerSelected = true

            // Добавление задержки перед показом следующего вопроса
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.quizBrain.nextQuestion()
                self.updateUI()
                self.answerSelected = false
                self.delegate?.didAnswerQuestion(correctAnswers: self.userCorrectAnswers)
            }
        }
    }
}

