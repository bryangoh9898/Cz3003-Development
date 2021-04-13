import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadQuestions {
  //get all the id's of mcq question to randmoize which one to have

  Future<List<int>> getIdOfAllMcqQuestions(
      int worldName, int stageName, int levelName) async {
    List<int> listOfQnID = [];

    return FirebaseFirestore.instance
        .collection("QuestionDatabase")
        .get()
        .then((querySnapShot) {
      querySnapShot.docs.forEach((questions) {
        if (questions.data()["World"] == worldName &&
            questions.data()["Stage"] == stageName &&
            questions.data()["Level"] == levelName &&
            questions.data()["Type"] == "mcq") {
          //means we found an mcq question
          listOfQnID.add(questions.data()["qnid"]);
        }
      });
      print(listOfQnID);
      return listOfQnID;
    });
    // return listOfQnID;
  }

  static Future<List<String>> getAnswer(int mcqID) async {
    return FirebaseFirestore.instance
        .collection("QuestionDatabase")
        .where("qnid", isEqualTo: mcqID)
        .get()
        .then((querySnapShot) {
      return querySnapShot.docs[0].reference.collection("Answers").get();
    }).then((querySnapShot) {
      List<String> tempAnswers = [];
      querySnapShot.docs.forEach((answer) {
        tempAnswers.add(answer.data()["choice 1"]);
        tempAnswers.add(answer.data()["choice 2"]);
        tempAnswers.add(answer.data()["choice 3"]);
        tempAnswers.add(answer.data()["choice 4"]);
      });
      return tempAnswers;
    });
  }

  static Future<McqQuestion> getMcq(int mcqID) async {
    int tempQID;
    String tempQuestion;

    return FirebaseFirestore.instance
        .collection("QuestionDatabase")
        .where("qnid", isEqualTo: mcqID)
        .get()
        .then((querySnapShot) async {
      querySnapShot.docs.forEach((element) async {
        tempQuestion = element.data()["Question"];
        tempQID = element.data()["qnid"];
      });
      List<String> tempAnswers = await getAnswer(mcqID);
      return McqQuestion(tempAnswers, tempQuestion, tempQID);
    });
  }

  Future<List<int>> getIdOfAllTFQuestions(
      int worldName, int stageName, int levelName) async {
    List<int> listOfQnID = [];

    return FirebaseFirestore.instance
        .collection("QuestionDatabase")
        .get()
        .then((querySnapShot) {
      querySnapShot.docs.forEach((questions) {
        if (questions.data()["World"] == worldName &&
            questions.data()["Stage"] == stageName &&
            questions.data()["Level"] == levelName &&
            questions.data()["Type"] == "T/F") {
          //means we found an True False question
          listOfQnID.add(questions.data()["qnid"]);
        }
      });
      print(listOfQnID);
      return listOfQnID;
    });
    // return listOfQnID;
  }

  static Future<TrueFalseQuestion> getTrueFalse(int tfID) async {
    int tempQID;
    String tempQuestion;
    String tempAnswers;

    return FirebaseFirestore.instance
        .collection("QuestionDatabase")
        .where("qnid", isEqualTo: tfID)
        .get()
        .then((querySnapShot) async {
      querySnapShot.docs.forEach((element) async {
        tempQuestion = element.data()["Question"];
        tempQID = element.data()["qnid"];
        tempAnswers = element.data()["Answer"];
      });
      return TrueFalseQuestion(tempAnswers, tempQuestion, tempQID);
    });
  }

  void loadFillInTheBlanks(String qnConfiguration) {}
}

class TrueFalseQuestion {
  String question;
  int qID;
  String answer;
  TrueFalseQuestion(answers, question, qID) {
    this.question = question;
    this.qID = qID;
    this.answer = answers;
  }
}

class McqQuestion {
  List<String> answers;
  String question;
  int qID;

  McqQuestion(answers, question, qID) {
    this.answers = answers;
    this.question = question;
    this.qID = qID;
  }
}
