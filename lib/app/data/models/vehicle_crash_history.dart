class VehicleCrashHistory {
  DateTime? tglKejadian;
  String? lokasi;
  String? noLp;
  String? pengemudi;
  String? noBerkas;
  int? totalSantunan;

  VehicleCrashHistory({
    this.tglKejadian,
    this.lokasi,
    this.noLp,
    this.pengemudi,
    this.noBerkas,
    this.totalSantunan,
  });

  VehicleCrashHistory.fromJson(Map<String, dynamic> json) {
    tglKejadian = DateTime.parse(json['tgl_kejadian']);
    lokasi = json['lokasi'];
    noLp = json['no_lp'];
    pengemudi = json['pengemudi'];
    noBerkas = json['no_berkas'];
    totalSantunan = json['total_santunan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tgl_kejadian'] = tglKejadian!.toIso8601String();
    data['lokasi'] = lokasi;
    data['no_lp'] = noLp;
    data['pengemudi'] = pengemudi;
    data['no_berkas'] = noBerkas;
    data['total_santunan'] = totalSantunan;
    return data;
  }
}
