class CheckAnswer {
  void checkMCQ() {}

  void checkTrueFalse() {}

  bool checkFillInTheBlanks(String originalAns, String userAns) {
    //Change both to lower case
    String orgAns = originalAns.toLowerCase();
    String useAns = userAns.toLowerCase();

    //Filter alphabets and numbers from user answers.
    useAns.replaceAll("[-+^]*^,.()!?", "");

    //check if orgAns == useAns
    if (useAns == orgAns) {
      return true;
    } else {
      return false;
    }
  }
}
