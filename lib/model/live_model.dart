class LiveStream {
  final String kodejadwal;
  final String idThnAkademik;
  final String idKelas;
  final String idMapel;
  final String idRuangan;
  final String idGuru;
  final String paralel;
  final String jadwalSerial;
  final String jamKe;
  final String jamMulai;
  final String jamSelesai;
  final String hari;
  final String jurnalSikap;
  final String remedial;
  final String aktif;
  final String penilaian;
  final String idIdentitasSekolah;
  final String kodePelajaran;
  final String idKelompokMapel;
  final String idKelompokMapelSub;
  final String idJurusan;
  final String namaMapel;
  final String namaMapelEn;
  final String idTingkat;
  final String kompetensiUmum;
  final String kompetensiKhusus;
  final String jumlahJam;
  final String sesi;
  final String urutan;
  final String kkm;
  final String karakter;
  final String id;
  final String mulai;
  final String selesai;
  final String joinUrl;
  final String meetingId;
  final String passcode;
  final String createdAt;
  final String updateAt;
  final String kodeKelas;
  final String namaKelas;
  final String nilai;
  final String daftarUlang;
  final String namaSiswa;
  final String statusLive;

  LiveStream({
    required this.kodejadwal,
    required this.idThnAkademik,
    required this.idKelas,
    required this.idMapel,
    required this.idRuangan,
    required this.idGuru,
    required this.paralel,
    required this.jadwalSerial,
    required this.jamKe,
    required this.jamMulai,
    required this.jamSelesai,
    required this.hari,
    required this.jurnalSikap,
    required this.remedial,
    required this.aktif,
    required this.penilaian,
    required this.idIdentitasSekolah,
    required this.kodePelajaran,
    required this.idKelompokMapel,
    required this.idKelompokMapelSub,
    required this.idJurusan,
    required this.namaMapel,
    required this.namaMapelEn,
    required this.idTingkat,
    required this.kompetensiUmum,
    required this.kompetensiKhusus,
    required this.jumlahJam,
    required this.sesi,
    required this.urutan,
    required this.kkm,
    required this.karakter,
    required this.id,
    required this.mulai,
    required this.selesai,
    required this.joinUrl,
    required this.meetingId,
    required this.passcode,
    required this.createdAt,
    required this.updateAt,
    required this.kodeKelas,
    required this.namaKelas,
    required this.nilai,
    required this.daftarUlang,
    required this.namaSiswa,
    required this.statusLive,
  });

  factory LiveStream.fromJson(Map<String, dynamic> json) {
    return LiveStream(
        kodejadwal: json['kodejdwl'],
        idThnAkademik: json['id_tahun_akademik'],
        idKelas: json['id_kelas'],
        idMapel: json['id_mata_pelajaran'],
        idRuangan: json['id_ruangan'],
        idGuru: json['id_guru'],
        paralel: json['paralel'],
        jadwalSerial: json['jadwal_serial'],
        jamKe: json['jam_ke'],
        jamMulai: json['jam_mulai'],
        jamSelesai: json['jam_selesai'],
        hari: json['hari'],
        jurnalSikap: json['jurnal_sikap'],
        remedial: json['remedial'],
        aktif: json['aktif'],
        penilaian: json['penilaian'],
        idIdentitasSekolah: json['id_identitas_sekolah'],
        kodePelajaran: json['kode_pelajaran'],
        idKelompokMapel: json['id_kelompok_mata_pelajaran'],
        idKelompokMapelSub: json['id_kelompok_mata_pelajaran_sub'],
        idJurusan: json['id_jurusan'],
        namaMapel: json['namamatapelajaran'],
        namaMapelEn: json['namamatapelajaran_en'],
        idTingkat: json['id_tingkat'],
        kompetensiUmum: json['kompetensi_umum'],
        kompetensiKhusus: json['kompetensi_khusus'],
        jumlahJam: json['jumlah_jam'],
        sesi: json['sesi'],
        urutan: json['urutan'],
        kkm: json['kkm'],
        karakter: json['karakter'],
        id: json['id'],
        mulai: json['mulai'],
        selesai: json['selesai'],
        joinUrl: json['join_url'],
        meetingId: json['meeting_id'],
        passcode: json['passcode'],
        createdAt: json['created_at'],
        updateAt: json['update_at'],
        kodeKelas: json['kode_kelas'],
        namaKelas: json['nama_kelas'],
        nilai: json['nilai'],
        daftarUlang: json['daftar_ulang'],
        namaSiswa: json['nama'],
        statusLive: json['status']);
  }
}
