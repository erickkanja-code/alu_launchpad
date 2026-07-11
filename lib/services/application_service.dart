import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/application_model.dart';

class ApplicationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitApplication(ApplicationModel application) async {
    final docRef = _firestore.collection('applications').doc();
    final data = application.toMap();
    data['id'] = docRef.id;
    await docRef.set(data);
  }

  Stream<List<ApplicationModel>> getStudentApplicationsStream(
      String studentId) {
    return _firestore
        .collection('applications')
        .where('studentId', isEqualTo: studentId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ApplicationModel.fromMap(doc.data()))
            .toList());
  }

  Stream<List<ApplicationModel>> getOpportunityApplicationsStream(
      String opportunityId) {
    return _firestore
        .collection('applications')
        .where('opportunityId', isEqualTo: opportunityId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ApplicationModel.fromMap(doc.data()))
            .toList());
  }

  Future<ApplicationModel?> getApplication(String id) async {
    final doc =
        await _firestore.collection('applications').doc(id).get();
    if (!doc.exists) return null;
    return ApplicationModel.fromMap(doc.data()!);
  }

  Future<void> updateApplicationStatus(String id, String status) async {
    await _firestore
        .collection('applications')
        .doc(id)
        .update({'status': status});
  }
}