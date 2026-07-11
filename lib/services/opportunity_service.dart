import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/opportunity_model.dart';

class OpportunityService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for student discover screen — all open opportunities
  Stream<List<OpportunityModel>> getOpportunitiesStream() {
    return _firestore
        .collection('opportunities')
        .where('status', isEqualTo: 'open')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OpportunityModel.fromMap(doc.data()))
            .toList());
  }

  // for startup dashboard — only that startup's opportunities
  Stream<List<OpportunityModel>> getStartupOpportunitiesStream(
      String startupId) {
    return _firestore
        .collection('opportunities')
        .where('startupId', isEqualTo: startupId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OpportunityModel.fromMap(doc.data()))
            .toList());
  }

  // fetch a single opportunity by ID
  Future<OpportunityModel?> getOpportunity(String id) async {
    final doc =
        await _firestore.collection('opportunities').doc(id).get();
    if (!doc.exists) return null;
    return OpportunityModel.fromMap(doc.data()!);
  }

  // create a new opportunity
  Future<void> createOpportunity(OpportunityModel opportunity) async {
    final docRef = _firestore.collection('opportunities').doc();
    final data = opportunity.toMap();
    data['id'] = docRef.id;
    await docRef.set(data);
  }

  // update specific fields on an existing opportunity
  Future<void> updateOpportunity(
      String id, Map<String, dynamic> data) async {
    await _firestore.collection('opportunities').doc(id).update(data);
  }

  // delete an opportunity
  Future<void> deleteOpportunity(String id) async {
    await _firestore.collection('opportunities').doc(id).delete();
  }
}