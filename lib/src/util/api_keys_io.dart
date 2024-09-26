import 'dart:io';

String getApiKey(String apiKeyName) => Platform.environment[apiKeyName] ?? '';
