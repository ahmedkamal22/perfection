import 'package:perfection/core/api/api_service.dart';
import 'package:perfection/core/utils/constants.dart';
import 'package:perfection/features/home/data/models/user_model.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<PaginatedResponse> fetchUsers(int page) async {
    final response =
        await apiService.get(url: allUsers, queryParameters: {'page': page});
    return PaginatedResponse.fromJson(response.data);
  }
}
