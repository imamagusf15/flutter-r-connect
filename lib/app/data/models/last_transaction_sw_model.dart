class LastTransactionIwModel {
  String? loketKantor;
  String? kodePo;
  String? namaPo;
  String? status;
  String? noResi;
  DateTime? tglTransaksi;
  DateTime? masaLakuAwal;
  DateTime? masaLakuAkhir;
  int? tarif;
  int? seat;
  int? total;

  LastTransactionIwModel({
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

  LastTransactionIwModel.fromJson(Map<String, dynamic> json) {
    loketKantor = json['loket_kantor'];
    kodePo = json['kode_po'];
    namaPo = json['nama_po'];
    status = json['status'];
    noResi = json['no_resi'];
    tglTransaksi = DateTime.parse(json['tgl_transaksi']);
    masaLakuAwal = DateTime.parse(json['masa_laku_awal']);
    masaLakuAkhir = DateTime.parse(json['masa_laku_akhir']);
    tarif = json['tarif'];
    seat = json['seat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['loket_kantor'] = loketKantor;
    data['kode_po'] = kodePo;
    data['nama_po'] = namaPo;
    data['status'] = status;
    data['no_resi'] = noResi;
    data['tgl_transaksi'] = tglTransaksi!.toIso8601String();
    data['masa_laku_awal'] = masaLakuAwal!.toIso8601String();
    data['masa_laku_akhir'] = masaLakuAkhir!.toIso8601String();
    data['tarif'] = tarif;
    data['seat'] = seat;
    data['total'] = total;
    return data;
  }
}
