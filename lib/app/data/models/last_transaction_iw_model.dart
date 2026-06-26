class LastTransactionIwModel {
  String? loketKantor;
  String? tglTransaksi;
  String? tglPenetapan;
  String? masaLakuAwal;
  String? masaLakuAkhir;
  int? kd;
  int? sw;
  int? denda;
  int? total;

  LastTransactionIwModel({
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

  LastTransactionIwModel.fromJson(Map<String, dynamic> json) {
    loketKantor = json['loket_kantor'];
    tglTransaksi = json['tgl_transaksi'];
    tglPenetapan = json['tgl_penetapan'];
    masaLakuAwal = json['masa_laku_awal'];
    masaLakuAkhir = json['masa_laku_akhir'];
    kd = json['kd'];
    sw = json['sw'];
    denda = json['denda'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loket_kantor'] = this.loketKantor;
    data['tgl_transaksi'] = this.tglTransaksi;
    data['tgl_penetapan'] = this.tglPenetapan;
    data['masa_laku_awal'] = this.masaLakuAwal;
    data['masa_laku_akhir'] = this.masaLakuAkhir;
    data['kd'] = this.kd;
    data['sw'] = this.sw;
    data['denda'] = this.denda;
    data['total'] = this.total;
    return data;
  }
}
