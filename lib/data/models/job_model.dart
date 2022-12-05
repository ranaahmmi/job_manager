class JobModel {
  final int? jobPk;
  final int? orgFk;
  final String? orgName;
  final int? jobTemplateFk;
  final String? jobTemplateName;
  final int? jobTypeFk;
  final String? jobTypeName;
  final int? clientFk;
  final String? clientCode;
  final String? clientName;
  final String? mobileNo;
  final String? address;
  final String? flat;
  final String? floor;
  final String? entrance;
  final String? jobCode;
  final String? scheduledOn;
  final String? scheduledAt;
  final String? description;
  final String? specialInstructions;
  final String? durationHours;
  final String? durationMinutes;
  final String? territoryFk;
  final int? assigneeFk;
  final String? currentStatus;
  final String? createdBy;
  final String? createdOn;
  final String? updatedBy;
  final String? updatedOn;
  final List<ClientContacts>? clientContacts;

  JobModel({
    this.jobPk,
    this.orgFk,
    this.orgName,
    this.jobTemplateFk,
    this.jobTemplateName,
    this.jobTypeFk,
    this.jobTypeName,
    this.clientFk,
    this.clientCode,
    this.clientName,
    this.mobileNo,
    this.address,
    this.flat,
    this.floor,
    this.entrance,
    this.jobCode,
    this.scheduledOn,
    this.scheduledAt,
    this.description,
    this.specialInstructions,
    this.durationHours,
    this.durationMinutes,
    this.territoryFk,
    this.assigneeFk,
    this.currentStatus,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.clientContacts,
  });

  JobModel copyWith({
    int? jobPk,
    int? orgFk,
    String? orgName,
    int? jobTemplateFk,
    String? jobTemplateName,
    int? jobTypeFk,
    String? jobTypeName,
    int? clientFk,
    String? clientCode,
    String? clientName,
    String? mobileNo,
    String? address,
    String? flat,
    String? floor,
    String? entrance,
    String? jobCode,
    String? scheduledOn,
    String? scheduledAt,
    String? description,
    String? specialInstructions,
    String? durationHours,
    String? durationMinutes,
    String? territoryFk,
    int? assigneeFk,
    String? currentStatus,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
    List<ClientContacts>? clientContacts,
  }) {
    return JobModel(
      jobPk: jobPk ?? this.jobPk,
      orgFk: orgFk ?? this.orgFk,
      orgName: orgName ?? this.orgName,
      jobTemplateFk: jobTemplateFk ?? this.jobTemplateFk,
      jobTemplateName: jobTemplateName ?? this.jobTemplateName,
      jobTypeFk: jobTypeFk ?? this.jobTypeFk,
      jobTypeName: jobTypeName ?? this.jobTypeName,
      clientFk: clientFk ?? this.clientFk,
      clientCode: clientCode ?? this.clientCode,
      clientName: clientName ?? this.clientName,
      mobileNo: mobileNo ?? this.mobileNo,
      address: address ?? this.address,
      flat: flat ?? this.flat,
      floor: floor ?? this.floor,
      entrance: entrance ?? this.entrance,
      jobCode: jobCode ?? this.jobCode,
      scheduledOn: scheduledOn ?? this.scheduledOn,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      description: description ?? this.description,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      durationHours: durationHours ?? this.durationHours,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      territoryFk: territoryFk ?? this.territoryFk,
      assigneeFk: assigneeFk ?? this.assigneeFk,
      currentStatus: currentStatus ?? this.currentStatus,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedOn: updatedOn ?? this.updatedOn,
      clientContacts: clientContacts ?? this.clientContacts,
    );
  }

  JobModel.fromJson(Map<String, dynamic> json)
    : jobPk = json['job_pk'] as int?,
      orgFk = json['org_fk'] as int?,
      orgName = json['org_name'] as String?,
      jobTemplateFk = json['job_template_fk'] as int?,
      jobTemplateName = json['job_template_name'] as String?,
      jobTypeFk = json['job_type_fk'] as int?,
      jobTypeName = json['job_type_name'] as String?,
      clientFk = json['client_fk'] as int?,
      clientCode = json['client_code'] as String?,
      clientName = json['client_name'] as String?,
      mobileNo = json['mobile_no'] as String?,
      address = json['address'] as String?,
      flat = json['flat'] as String?,
      floor = json['floor'] as String?,
      entrance = json['entrance'] as String?,
      jobCode = json['job_code'] as String?,
      scheduledOn = json['scheduled_on'] as String?,
      scheduledAt = json['scheduled_at'] as String?,
      description = json['description'] as String?,
      specialInstructions = json['special_instructions'] as String?,
      durationHours = json['duration_hours'] as String?,
      durationMinutes = json['duration_minutes'] as String?,
      territoryFk = json['territory_fk'] as String?,
      assigneeFk = json['assignee_fk'] as int?,
      currentStatus = json['current_status'] as String?,
      createdBy = json['created_by'] as String?,
      createdOn = json['created_on'] as String?,
      updatedBy = json['updated_by'] as String?,
      updatedOn = json['updated_on'] as String?,
      clientContacts = (json['client_contacts'] as List?)?.map((dynamic e) => ClientContacts.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'job_pk' : jobPk,
    'org_fk' : orgFk,
    'org_name' : orgName,
    'job_template_fk' : jobTemplateFk,
    'job_template_name' : jobTemplateName,
    'job_type_fk' : jobTypeFk,
    'job_type_name' : jobTypeName,
    'client_fk' : clientFk,
    'client_code' : clientCode,
    'client_name' : clientName,
    'mobile_no' : mobileNo,
    'address' : address,
    'flat' : flat,
    'floor' : floor,
    'entrance' : entrance,
    'job_code' : jobCode,
    'scheduled_on' : scheduledOn,
    'scheduled_at' : scheduledAt,
    'description' : description,
    'special_instructions' : specialInstructions,
    'duration_hours' : durationHours,
    'duration_minutes' : durationMinutes,
    'territory_fk' : territoryFk,
    'assignee_fk' : assigneeFk,
    'current_status' : currentStatus,
    'created_by' : createdBy,
    'created_on' : createdOn,
    'updated_by' : updatedBy,
    'updated_on' : updatedOn,
    'client_contacts' : clientContacts?.map((e) => e.toJson()).toList()
  };
}

class ClientContacts {
  final String? contactPerson;
  final String? phoneNo;

  ClientContacts({
    this.contactPerson,
    this.phoneNo,
  });

  ClientContacts copyWith({
    String? contactPerson,
    String? phoneNo,
  }) {
    return ClientContacts(
      contactPerson: contactPerson ?? this.contactPerson,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  ClientContacts.fromJson(Map<String, dynamic> json)
    : contactPerson = json['contact_person'] as String?,
      phoneNo = json['phone_no'] as String?;

  Map<String, dynamic> toJson() => {
    'contact_person' : contactPerson,
    'phone_no' : phoneNo
  };
}
class JobStatus {
  final String? jobStatus;
  final String? statusDate;
  final String? remarks;

  JobStatus({
    this.jobStatus,
    this.statusDate,
    this.remarks,
  });

  JobStatus copyWith({
    String? jobStatus,
    String? statusDate,
    String? remarks,
  }) {
    return JobStatus(
      jobStatus: jobStatus ?? this.jobStatus,
      statusDate: statusDate ?? this.statusDate,
      remarks: remarks ?? this.remarks,
    );
  }

  JobStatus.fromJson(Map<String, dynamic> json)
    : jobStatus = json['job_status'] as String?,
      statusDate = json['status_date'] as String?,
      remarks = json['remarks'] as String?;

  Map<String, dynamic> toJson() => {
    'job_status' : jobStatus,
    'status_date' : statusDate,
    'remarks' : remarks
  };
}