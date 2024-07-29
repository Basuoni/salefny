import 'dart:io';

import 'package:salefny/app/core/api_helpers/dio_client.dart';
import 'package:salefny/app/core/api_helpers/dio_providers.dart';
import 'package:salefny/app/core/api_helpers/endpoints.dart';
import 'package:salefny/app/core/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final versionServicesProvider = Provider(
  (ref) => VersionService(dioClient: ref.read(dioClientProvider)),
);

class VersionService {
  final DioClient dioClient;

  const VersionService({required this.dioClient});

  Future<String> get version async =>
      (await PackageInfo.fromPlatform()).version;

  String get platform => Platform.isIOS ? 'ios' : 'android';

  Future<UpdateModel> checkVersion() async {
    final res = await dioClient.post(
      Endpoints.versionCheck,
      body: {
        'version': await version,
        'platform': platform,
      },
    );
    final data = (res.data as Json)['data'] as Json;
    return UpdateModel.fromJson(data['update'] as Json);
  }
}

class UpdateModel {
  final bool isAvailable;
  final bool isRequired;

  const UpdateModel({
    required this.isAvailable,
    required this.isRequired,
  });

  bool get isNotRequired => !isRequired;

  factory UpdateModel.fromJson(Json data) {
    return UpdateModel(
      isAvailable: data['available'] as bool,
      isRequired: data['required'] as bool,
    );
  }
}
