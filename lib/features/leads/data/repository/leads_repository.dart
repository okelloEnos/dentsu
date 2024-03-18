import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/leads/data/data_provider/leads_data_provider.dart';

class LeadsRepository{
  final LeadsDataProvider _leadsDataProvider;

  LeadsRepository({required LeadsDataProvider leadsDataProvider}) : _leadsDataProvider = leadsDataProvider;

  Future<void> createLeadRequest({required Lead lead}) async {
    await _leadsDataProvider.createLeadRequest(lead: lead);
  }

  Future<void> updateLeadRequest({required Lead lead}) async {
    await _leadsDataProvider.updateLeadRequest(lead: lead);
  }

  Future<void> deleteLeadRequest({required String id}) async {
    await _leadsDataProvider.deleteLeadRequest(id: id);
  }

  Future<List<Lead>> fetchAllLeadsRequest() async{
    final allLeadsResponse = await _leadsDataProvider.fetchAllLeadsRequest();
    List<Lead> listOfLeads = [];
    listOfLeads = List<Lead>.from(allLeadsResponse.map((leadMap) => Lead.fromJson(leadMap)));
    return listOfLeads;
  }

Future<Lead> fetchLeadByIdRequest({required String id}) async{
    final leadResponse = await _leadsDataProvider.fetchLeadByIdRequest(id: id);
    Lead lead = Lead.fromJson(leadResponse);
    return lead;
  }
}