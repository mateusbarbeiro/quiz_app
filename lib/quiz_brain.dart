import 'package:quiz_app/question.dart';

class QuizBrain {
     int _questionNumber = 0;

    final List<Questions> _questions = [
        Questions(
            question: 'Você pode conduzir uma vaca escada abaixo, mas não escada acima.',
            answer: false,
        ),
        Questions(
            question: 'Aproximadamente um quarto dos ossos humanos estão nos pés.',
            answer: true,
        ),
        Questions(
            question: 'O sangue de uma lesma é verde.',
            answer: true,
        ),
        Questions(
            question: 'Alguns gatos são alérgicos a humanos.',
            answer: true,
        ),
        Questions(
            question: 'O nome de solteira da mãe de Buzz Aldrin era "Lua".',
            answer: true,
        ),
        Questions(
            question: 'É ilegal fazer xixi no oceano em Portugal.',
            answer: true,
        ),
        Questions(
            question: 'Nenhum pedaço de papel quadrado seco pode ser dobrado ao meio mais de 7 vezes.',
            answer: false,
        ),
        Questions(
            question: 'Em Londres, Reino Unido, se por acaso você morrer na Câmara do Parlamento, você tem tecnicamente direito a um funeral de estado, porque o prédio é considerado um lugar sagrado demais.',
            answer: true,
        ),
        Questions(
            question: 'O som mais alto produzido por qualquer animal é de 188 decibéis. Esse animal é o elefante africano.', 
            answer: false,
        ),
        Questions(
            question: 'A área total de superfície de dois pulmões humanos é de aproximadamente 70 metros quadrados.',
            answer: true,
        ),
        Questions(
            question: 'O Google era originalmente chamado de "Backrub".', 
            answer: true
        ),
        Questions(
            question: 'O chocolate afeta o coração e o sistema nervoso de um cão; alguns gramas são suficientes para matar um cachorro pequeno.',
            answer: true
        ),
        Questions(
            question: 'Em West Virginia, EUA, se você acidentalmente atropelar um animal com seu carro, pode levá-lo para casa para comer.',
            answer: true
        )
    ];

    String getQuestionText() {
        return _questions[_questionNumber].question;
    }

    bool getQuestionAnswer() {
        return _questions[_questionNumber].answer;
    }

    int getLength() {
        return _questions.length;
    }

    void nextQuestion() {
        if (_questionNumber < _questions.length - 1) {
            _questionNumber++;
        }
    }

    bool isFinished() {
        if (_questionNumber == getLength() - 1) {
            return true;
        }
        return false;
    }

    void reset() {
        _questionNumber = 0;
    }
}
