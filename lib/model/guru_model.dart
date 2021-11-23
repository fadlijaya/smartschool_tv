class Guru {
  final String idGuru;
  final String idIdentitasSekolah;
  final String nip;
  final String password;
  final String namaGuru;
  final String idJekel;
  final String tempatLahir;
  final String tglLahir;
  final String nik;
  final String niyNigk;
  final String nuptk;
  final String idStatusKepegawaian;
  final String idJenisPtk;
  final String pengawasBidStudi;
  final String idAgama;
  final String alamatJalan;
  final String rt;
  final String rw;
  final String namaDusun;
  final String desaKelurahan;
  final String kecamatan;
  final String kodePos;
  final String telepon;
  final String hp;
  final String email;
  final String tugasTambahan;
  final String idStatusKeaktifan;
  final String skCpns;
  final String tglCpns;
  final String skPengangkatan;
  final String tmtPengangkatan;
  final String lembagaPengangkatan;
  final String idGolongan;
  final String keahlianLab;
  final String sumberGaji;
  final String namaIbuKandung;
  final String idStatusNikah;
  final String namaSuamiIstri;
  final String nipSuamiIstri;
  final String pekerjaanSuamiIstri;
  final String tmtPns;
  final String lisensiKepsek;
  final String jumlahSekolahBinaan;
  final String diklatKepengawasan;
  final String mampuHandleKK;
  final String keahlianBreile;
  final String keahlianBhsIsyarat;
  final String npwp;
  final String kewarganegaraan;
  final String foto;
  final String guruBk;
  final String guruPiket;
  final String ppdb;
  final String pustaka;
  final String koperasi;
  final String asset;
  final String finance;
  final String idPendidikanTerakhir;
  final String kepSek;

  Guru(
      {required this.idGuru,
      required this.idIdentitasSekolah,
      required this.nip,
      required this.password,
      required this.namaGuru,
      required this.idJekel,
      required this.tempatLahir,
      required this.tglLahir,
      required this.nik,
      required this.niyNigk,
      required this.nuptk,
      required this.idStatusKepegawaian,
      required this.idJenisPtk,
      required this.pengawasBidStudi,
      required this.idAgama,
      required this.alamatJalan,
      required this.rt,
      required this.rw,
      required this.namaDusun,
      required this.desaKelurahan,
      required this.kecamatan,
      required this.kodePos,
      required this.telepon,
      required this.hp,
      required this.email,
      required this.tugasTambahan,
      required this.idStatusKeaktifan,
      required this.skCpns,
      required this.tglCpns,
      required this.skPengangkatan,
      required this.tmtPengangkatan,
      required this.lembagaPengangkatan,
      required this.idGolongan,
      required this.keahlianLab,
      required this.sumberGaji,
      required this.namaIbuKandung,
      required this.idStatusNikah,
      required this.namaSuamiIstri,
      required this.nipSuamiIstri,
      required this.pekerjaanSuamiIstri,
      required this.tmtPns,
      required this.lisensiKepsek,
      required this.jumlahSekolahBinaan,
      required this.diklatKepengawasan,
      required this.mampuHandleKK,
      required this.keahlianBreile,
      required this.keahlianBhsIsyarat,
      required this.npwp,
      required this.kewarganegaraan,
      required this.foto,
      required this.guruBk,
      required this.guruPiket,
      required this.ppdb,
      required this.pustaka,
      required this.koperasi,
      required this.asset,
      required this.finance,
      required this.idPendidikanTerakhir,
      required this.kepSek});

  factory Guru.fromJson(Map<String, dynamic> json) {
    return Guru(
        idGuru: json['id_guru'],
        idIdentitasSekolah: json['id_identitas_sekolah'],
        nip: json['nip'],
        password: json['password'],
        namaGuru: json['nama_guru'],
        idJekel: json['id_jenis_kelamin'],
        tempatLahir: json['tempat_lahir'],
        tglLahir: json['tanggal_lahir'],
        nik: json['nik'],
        niyNigk: json['niy_nigk'],
        nuptk: json['nuptk'],
        idStatusKepegawaian: json['id_status_kepegawaian'],
        idJenisPtk: json['id_jenis_ptk'],
        pengawasBidStudi: json['pengawas_bidang_studi'],
        idAgama: json['id_agama'],
        alamatJalan: json['alamat_jalan'],
        rt: json['rt'],
        rw: json['rw'],
        namaDusun: json['nama_dusun'],
        desaKelurahan: json['desa_kelurahan'],
        kecamatan: json['kecamatan'],
        kodePos: json['kode_pos'],
        telepon: json['telepon'],
        hp: json['hp'],
        email: json['email'],
        tugasTambahan: json['tugas_tambahan'],
        idStatusKeaktifan: json['id_status_keaktifan'],
        skCpns: json['sk_cpns'],
        tglCpns: json['tanggal_cpns'],
        skPengangkatan: json['sk_pengangkatan'],
        tmtPengangkatan: json['tmt_pengangkatan'],
        lembagaPengangkatan: json['lembaga_pengangkatan'],
        idGolongan: json['id_golongan'],
        keahlianLab: json['keahlian_laboratorium'],
        sumberGaji: json['sumber_gaji'],
        namaIbuKandung: json['nama_ibu_kandung'],
        idStatusNikah: json['id_status_pernikahan'],
        namaSuamiIstri: json['nama_suami_istri'],
        nipSuamiIstri: json['nip_suami_istri'],
        pekerjaanSuamiIstri: json['pekerjaan_suami_istri'],
        tmtPns: json['tmt_pns'],
        lisensiKepsek: json['lisensi_kepsek'],
        jumlahSekolahBinaan: json['jumlah_sekolah_binaan'],
        diklatKepengawasan: json['diklat_kepengawasan'],
        mampuHandleKK: json['mampu_handle_kk'],
        keahlianBreile: json['keahlian_breile'],
        keahlianBhsIsyarat: json['keahlian_bahasa_isyarat'],
        npwp: json['npwp'],
        kewarganegaraan: json['kewarganegaraan'],
        foto: json['foto'],
        guruBk: json['guru_bk'],
        guruPiket: json['guru_piket'],
        ppdb: json['ppdb'],
        pustaka: json['pustaka'],
        koperasi: json['koperasi'],
        asset: json['asset'],
        finance: json['finance'],
        idPendidikanTerakhir: json['id_pendidikan_terakhir'],
        kepSek: json['kepala_sekolah']);
  }
}
