import '../database.dart';

class RolePermissionsTable extends SupabaseTable<RolePermissionsRow> {
  @override
  String get tableName => 'role_permissions';

  @override
  RolePermissionsRow createRow(Map<String, dynamic> data) =>
      RolePermissionsRow(data);
}

class RolePermissionsRow extends SupabaseDataRow {
  RolePermissionsRow(super.data);

  @override
  SupabaseTable get table => RolePermissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get permission => getField<String>('permission')!;
  set permission(String value) => setField<String>('permission', value);
}
