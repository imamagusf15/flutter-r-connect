class VehicleCrashHistory {
  String? tglKejadian;
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
    tglKejadian = json['tgl_kejadian'];
    lokasi = json['lokasi'];
    noLp = json['no_lp'];
    pengemudi = json['pengemudi'];
    noBerkas = json['no_berkas'];
    totalSantunan = json['total_santunan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tgl_kejadian'] = this.tglKejadian;
    data['lokasi'] = this.lokasi;
    data['no_lp'] = this.noLp;
    data['pengemudi'] = this.pengemudi;
    data['no_berkas'] = this.noBerkas;
    data['total_santunan'] = this.totalSantunan;
    return data;
  }
}
