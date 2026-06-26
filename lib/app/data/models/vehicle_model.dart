class Vehicle {
  String? noPolisi;
  String? noRangka;
  String? noMesin;
  String? tahun;
  String? cc;
  String? jenis;
  String? warna;
  String? namaPemilik;
  String? nik;
  String? noHp;
  String? alamat;

  Vehicle({
    this.noPolisi,
    this.noRangka,
    this.noMesin,
    this.tahun,
    this.cc,
    this.jenis,
    this.warna,
    this.namaPemilik,
    this.nik,
    this.noHp,
    this.alamat,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    noPolisi = json['no_polisi'];
    noRangka = json['no_rangka'];
    noMesin = json['no_mesin'];
    tahun = json['tahun'];
    cc = json['cc'];
    jenis = json['jenis'];
    warna = json['warna'];
    namaPemilik = json['nama_pemilik'];
    nik = json['nik'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['no_polisi'] = noPolisi;
    data['no_rangka'] = noRangka;
    data['no_mesin'] = noMesin;
    data['tahun'] = tahun;
    data['cc'] = cc;
    data['jenis'] = jenis;
    data['warna'] = warna;
    data['nama_pemilik'] = namaPemilik;
    data['nik'] = nik;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    return data;
  }
}
