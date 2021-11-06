/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CheeseRecipe type in your schema. */
@immutable
class CheeseRecipe extends Model {
  static const classType = const _CheeseRecipeModelType();
  final String id;
  final String? _cheeseName;
  final String? _myNotes;
  final String? _cheeseStatus;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get cheeseName {
    try {
      return _cheeseName!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get myNotes {
    return _myNotes;
  }
  
  String get cheeseStatus {
    try {
      return _cheeseStatus!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const CheeseRecipe._internal({required this.id, required cheeseName, myNotes, required cheeseStatus}): _cheeseName = cheeseName, _myNotes = myNotes, _cheeseStatus = cheeseStatus;
  
  factory CheeseRecipe({String? id, required String cheeseName, String? myNotes, required String cheeseStatus}) {
    return CheeseRecipe._internal(
      id: id == null ? UUID.getUUID() : id,
      cheeseName: cheeseName,
      myNotes: myNotes,
      cheeseStatus: cheeseStatus);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheeseRecipe &&
      id == other.id &&
      _cheeseName == other._cheeseName &&
      _myNotes == other._myNotes &&
      _cheeseStatus == other._cheeseStatus;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CheeseRecipe {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("cheeseName=" + "$_cheeseName" + ", ");
    buffer.write("myNotes=" + "$_myNotes" + ", ");
    buffer.write("cheeseStatus=" + "$_cheeseStatus");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CheeseRecipe copyWith({String? id, String? cheeseName, String? myNotes, String? cheeseStatus}) {
    return CheeseRecipe(
      id: id ?? this.id,
      cheeseName: cheeseName ?? this.cheeseName,
      myNotes: myNotes ?? this.myNotes,
      cheeseStatus: cheeseStatus ?? this.cheeseStatus);
  }
  
  CheeseRecipe.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _cheeseName = json['cheeseName'],
      _myNotes = json['myNotes'],
      _cheeseStatus = json['cheeseStatus'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'cheeseName': _cheeseName, 'myNotes': _myNotes, 'cheeseStatus': _cheeseStatus
  };

  static final QueryField ID = QueryField(fieldName: "cheeseRecipe.id");
  static final QueryField CHEESENAME = QueryField(fieldName: "cheeseName");
  static final QueryField MYNOTES = QueryField(fieldName: "myNotes");
  static final QueryField CHEESESTATUS = QueryField(fieldName: "cheeseStatus");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CheeseRecipe";
    modelSchemaDefinition.pluralName = "CheeseRecipes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheeseRecipe.CHEESENAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheeseRecipe.MYNOTES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CheeseRecipe.CHEESESTATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CheeseRecipeModelType extends ModelType<CheeseRecipe> {
  const _CheeseRecipeModelType();
  
  @override
  CheeseRecipe fromJson(Map<String, dynamic> jsonData) {
    return CheeseRecipe.fromJson(jsonData);
  }
}