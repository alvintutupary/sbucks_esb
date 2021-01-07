class ModelBank {
  String imageUri;
  String bankName;
  List<ModelBankMethod> modelBankMethod;

  ModelBank(
    this.imageUri,
    this.bankName,
    this.modelBankMethod,
  );
}

class ModelBankMethod {
  String method;
  List<ModelBankMethodStep> modelBankMethodStep;
  ModelBankMethod(
    this.method,
    this.modelBankMethodStep,
  );
}

class ModelBankMethodStep {
  String imageUri;
  String content;
  ModelBankMethodStep(
    this.imageUri,
    this.content,
  );
}
