class LastTransactionSwModel {
  String? loketKantor;
  DateTime? tglTransaksi;
  DateTime? tglPenetapan;
  DateTime? masaLakuAwal;
  DateTime? masaLakuAkhir;
  int? kd;
  int? sw;
  int? denda;
  int? total;

  LastTransactionSwModel({
    this.loketKantor,
    this.tglTransaksi,
    this.tglPenetapan,
    this.masaLakuAwal,
    this.masaLakuAkhir,
    this.kd,
    this.sw,
    this.denda,
    this.total,
  });

  LastTransactionSwModel.fromJson(Map<String, dynamic> json) {
    loketKantor = json['loket_kantor'];
    tglTransaksi = DateTime.parse(json['tgl_transaksi']);
    tglPenetapan = DateTime.parse(json['tgl_penetapan']);
    masaLakuAwal = DateTime.parse(json['masa_laku_awal']);
    masaLakuAkhir = DateTime.parse(json['masa_laku_akhir']);
    kd = json['kd'];
    sw = json['sw'];
    denda = json['denda'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['loket_kantor'] = loketKantor;
    data['tgl_transaksi'] = tglTransaksi!.toIso8601String();
    data['tgl_penetapan'] = tglPenetapan!.toIso8601String();
    data['masa_laku_awal'] = masaLakuAwal!.toIso8601String();
    data['masa_laku_akhir'] = masaLakuAkhir!.toIso8601String();
    data['kd'] = kd;
    data['sw'] = sw;
    data['denda'] = denda;
    data['total'] = total;
    return data;
  }
}
