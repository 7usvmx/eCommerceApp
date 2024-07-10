import 'package:shop/core/classes/crud.dart';
import 'package:shop/core/constants/urls/api_urls.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  postData() async {
    var response = await crud.postData(ApiUrls.home, {});
    return response.fold((l) => l, (r) => r);
  }

  search(String searchText) async {
    var response = await crud.postData(
      ApiUrls.search,
      {
        "searchName": searchText,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
