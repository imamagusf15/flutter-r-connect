class LastTransactionSwModel {
  String? loketKantor;
  String? kodePo;
  String? namaPo;
  String? status;
  String? noResi;
  String? tglTransaksi;
  String? masaLakuAwal;
  String? masaLakuAkhir;
  int? tarif;
  int? seat;
  int? total;

  LastTransactionSwModel({
    this.loketKantor,
    this.kodePo,
    this.namaPo,
    this.status,
    this.noResi,
    this.tglTransaksi,
    this.masaLakuAwal,
    this.masaLakuAkhir,
    this.tarif,
    this.seat,
    this.total,
  });

  LastTransactionSwModel.fromJson(Map<String, dynamic> json) {
    loketKantor = json['loket_kantor'];
    kodePo = json['kode_po'];
    namaPo = json['nama_po'];
    status = json['status'];
    noResi = json['no_resi'];
    tglTransaksi = json['tgl_transaksi'];
    masaLakuAwal = json['masa_laku_awal'];
    masaLakuAkhir = json['masa_laku_akhir'];
    tarif = json['tarif'];
    seat = json['seat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loket_kantor'] = this.loketKantor;
    data['kode_po'] = this.kodePo;
    data['nama_po'] = this.namaPo;
    data['status'] = this.status;
    data['no_resi'] = this.noResi;
    data['tgl_transaksi'] = this.tglTransaksi;
    data['masa_laku_awal'] = this.masaLakuAwal;
    data['masa_laku_akhir'] = this.masaLakuAkhir;
    data['tarif'] = this.tarif;
    data['seat'] = this.seat;
    data['total'] = this.total;
    return data;
  }
}
