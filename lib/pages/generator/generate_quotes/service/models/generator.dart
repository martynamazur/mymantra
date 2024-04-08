/// choices : [{"finish_reason":"stop","index":0,"message":{"content":"The 2020 World Series was played in Texas at Globe Life Field in Arlington.","role":"assistant"},"logprobs":null}]
/// created : 1677664795
/// id : "chatcmpl-7QyqpwdfhqwajicIEznoc6Q47XAyW"
/// model : "gpt-3.5-turbo-0613"
/// object : "chat.completion"
/// usage : {"completion_tokens":17,"prompt_tokens":57,"total_tokens":74}

class GenModel {
  GenModel({
      List<Choices>? choices, 
      num? created, 
      String? id, 
      String? model, 
      String? object, 
      Usage? usage,}){
    _choices = choices;
    _created = created;
    _id = id;
    _model = model;
    _object = object;
    _usage = usage;
}

  GenModel.fromJson(dynamic json) {
    if (json['choices'] != null) {
      _choices = [];
      json['choices'].forEach((v) {
        _choices?.add(Choices.fromJson(v));
      });
    }
    _created = json['created'];
    _id = json['id'];
    _model = json['model'];
    _object = json['object'];
    _usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }
  List<Choices>? _choices;
  num? _created;
  String? _id;
  String? _model;
  String? _object;
  Usage? _usage;
GenModel copyWith({  List<Choices>? choices,
  num? created,
  String? id,
  String? model,
  String? object,
  Usage? usage,
}) => GenModel(  choices: choices ?? _choices,
  created: created ?? _created,
  id: id ?? _id,
  model: model ?? _model,
  object: object ?? _object,
  usage: usage ?? _usage,
);
  List<Choices>? get choices => _choices;
  num? get created => _created;
  String? get id => _id;
  String? get model => _model;
  String? get object => _object;
  Usage? get usage => _usage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_choices != null) {
      map['choices'] = _choices?.map((v) => v.toJson()).toList();
    }
    map['created'] = _created;
    map['id'] = _id;
    map['model'] = _model;
    map['object'] = _object;
    if (_usage != null) {
      map['usage'] = _usage?.toJson();
    }
    return map;
  }

}

/// completion_tokens : 17
/// prompt_tokens : 57
/// total_tokens : 74

class Usage {
  Usage({
      num? completionTokens, 
      num? promptTokens, 
      num? totalTokens,}){
    _completionTokens = completionTokens;
    _promptTokens = promptTokens;
    _totalTokens = totalTokens;
}

  Usage.fromJson(dynamic json) {
    _completionTokens = json['completion_tokens'];
    _promptTokens = json['prompt_tokens'];
    _totalTokens = json['total_tokens'];
  }
  num? _completionTokens;
  num? _promptTokens;
  num? _totalTokens;
Usage copyWith({  num? completionTokens,
  num? promptTokens,
  num? totalTokens,
}) => Usage(  completionTokens: completionTokens ?? _completionTokens,
  promptTokens: promptTokens ?? _promptTokens,
  totalTokens: totalTokens ?? _totalTokens,
);
  num? get completionTokens => _completionTokens;
  num? get promptTokens => _promptTokens;
  num? get totalTokens => _totalTokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['completion_tokens'] = _completionTokens;
    map['prompt_tokens'] = _promptTokens;
    map['total_tokens'] = _totalTokens;
    return map;
  }

}

/// finish_reason : "stop"
/// index : 0
/// message : {"content":"The 2020 World Series was played in Texas at Globe Life Field in Arlington.","role":"assistant"}
/// logprobs : null

class Choices {
  Choices({
      String? finishReason, 
      num? index, 
      Message? message, 
      dynamic logprobs,}){
    _finishReason = finishReason;
    _index = index;
    _message = message;
    _logprobs = logprobs;
}

  Choices.fromJson(dynamic json) {
    _finishReason = json['finish_reason'];
    _index = json['index'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _logprobs = json['logprobs'];
  }
  String? _finishReason;
  num? _index;
  Message? _message;
  dynamic _logprobs;
Choices copyWith({  String? finishReason,
  num? index,
  Message? message,
  dynamic logprobs,
}) => Choices(  finishReason: finishReason ?? _finishReason,
  index: index ?? _index,
  message: message ?? _message,
  logprobs: logprobs ?? _logprobs,
);
  String? get finishReason => _finishReason;
  num? get index => _index;
  Message? get message => _message;
  dynamic get logprobs => _logprobs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['finish_reason'] = _finishReason;
    map['index'] = _index;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    map['logprobs'] = _logprobs;
    return map;
  }

}

/// content : "The 2020 World Series was played in Texas at Globe Life Field in Arlington."
/// role : "assistant"

class Message {
  Message({
      String? content, 
      String? role,}){
    _content = content;
    _role = role;
}

  Message.fromJson(dynamic json) {
    _content = json['content'];
    _role = json['role'];
  }
  String? _content;
  String? _role;
Message copyWith({  String? content,
  String? role,
}) => Message(  content: content ?? _content,
  role: role ?? _role,
);
  String? get content => _content;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['role'] = _role;
    return map;
  }

}