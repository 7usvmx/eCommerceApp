import 'package:flutter/material.dart';
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/shared/custom_loading.dart';
import 'package:shop/core/shared/no_data.dart';
import 'package:shop/core/shared/no_internet_connection.dart';
import 'package:shop/core/shared/server_error.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CustomLoading())
        : statusRequest == StatusRequest.offlineFailure
            ? const NoInternetConnection()
            : statusRequest == StatusRequest.serverFailure
                ? const ServerError()
                : statusRequest == StatusRequest.failure
                    ? const NoData()
                    : statusRequest == StatusRequest.noData
                        ? const NoData()
                        : widget;
  }
}
