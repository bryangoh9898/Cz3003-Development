import 'package:ssadgame/Controller/LoadQuestion.dart';

class ControlData {
  int score;
  int totalQuestions;
  int numberOfQuestionsLeft;
  List<int> questionsDone;
  int world;
  int stage;
  int level;

  String getScoreFormat() {
    return ('$score / $totalQuestions');
  }

  ControlData(String world, String stage, String level) {
    this.score = 0;
    this.totalQuestions = 6;
    this.numberOfQuestionsLeft = 10;
    questionsDone = [];
    this.world = int.parse(world.substring(6));
    this.stage = int.parse(stage.substring(6));
    this.level = int.parse(level.substring(6));
    print(world + stage + level);
  }

  Future<int> getMcqQuestion() async {
    List<int> allQuestions =
        await LoadQuestions().getIdOfAllMcqQuestions(world, stage, level);
    //If my question has been asked before, i continue looping and find a qn
    //that has not been done before
    //Once I find a qn,
    //Then I return and display that question, and update my total question done and update that question as done.

    for (int i = 0; i < allQuestions.length; i++) {
      if (questionsDone.contains(allQuestions[i])) {
        continue;
      } else {
        questionsDone.add(allQuestions[i]);
        // totalQuestions++;
        return allQuestions[i];
      }
    }
  }

  Future<int> getTFQuestion() async {
    List<int> allQuestions =
        await LoadQuestions().getIdOfAllTFQuestions(world, stage, level);
    for (int i = 0; i < allQuestions.length; i++) {
      if (questionsDone.contains(allQuestions[i])) {
        continue;
      } else {
        questionsDone.add(allQuestions[i]);
        totalQuestions++;
        return allQuestions[i];
      }
    }
  }

  void updateScoreCorrectAnswer() {
    score++;
    totalQuestions++;
  }

  int getTotalQuestions() {
    return totalQuestions;
  }

  void updateTotal() {
    totalQuestions++;
  }
}
