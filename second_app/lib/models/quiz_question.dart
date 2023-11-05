// 위젯이 아니기 때문에 확장 x
class QuizQuestion {
  const QuizQuestion(this.text, this.answers); // 생성자

  final String text;
  final List<String> answers;

  List<String> get shuffleAnswers {
    // getter
    // 기존의 답변을 기반으로 새로운 리스트를 생성할 수 있다
    // 새 목록은 섞인 것이 되고 이전 목록은 그대로 둔다
    // 체이닝 -> 다른 함수나 메서드를 호출한 결과 메서드를 호출
    final shuffledList = List.of(answers); // 복사본을 먼저 생성하고
    shuffledList.shuffle(); // 섞는다
    return shuffledList;
  }
}
