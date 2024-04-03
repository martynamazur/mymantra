class QuotePrompt{
  int amount = 1;
  bool isShort = true;


  QuotePrompt(this.amount, this.isShort);

  String createPrompt(String description){
    String promptType = isShort ? "short" : "long";
    String defaultPrompt = "Generate $amount , $promptType quotes about $description, ensuring each quote is followed by a newline character for formatting. Avoid including numbers before each quote, quotation marks, your comments.";
      return defaultPrompt;
  }


}