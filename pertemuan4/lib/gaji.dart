class Gaji {
  String? golongan;
  String? status;
  int masakerja = 0;

  void setGolongan(String? gol) {
    golongan = gol;
  }

  void setStatus(String? sts) {
    status = sts;
  }

  void setMasaKerja(int masa) {
    masakerja = masa;
  }

  int tunjGapok() {
    int tunjangan = 0;

    if (golongan == "I") {
      tunjangan = 250000;
    } else if (golongan == "II") {
      tunjangan = 300000;
    } else if (golongan == "III") {
      tunjangan = 350000;
    } else {
      tunjangan = 400000;
    }
    return tunjangan;
  }

  int tunjStatus() {
    int tunjangan = 0;

    if (status == "Menikah") {
      tunjangan = 100000;
    } else {
      tunjangan = 50000;
    }

    return tunjangan;
  }

  int tunjMasaKerja() {
    int tunjangan = 0;

    if (masakerja > 0 && masakerja <= 3) {
      tunjangan = 100000;
    } else if (masakerja > 3 && masakerja <= 6) {
      tunjangan = 150000;
    } else {
      tunjangan = 200000;
    }

    return tunjangan;
  }

  int gajiTotal() {
    return tunjGapok() + tunjStatus() + tunjMasaKerja();
  }
}
