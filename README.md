# My nvim configurations

Ini adalah repositori yang saya fork dari [lzif](https://github.com/lzif/nvim) untuk menyimpan konfigurasi sesuai dengan kebutuhan saya. Disini saya mengandalkan Packer sebagai plugin manager, dan saya menggunakan beberapa plugin yang saya rasa penting untuk menunjang produktivitas saya dalam menggunakan neovimim di Termux.

Beberapa fitur bawaan dari [lzif](https://github.com/lzif/nvim) tidak lagi saya gunakan. Saya hanya menyisakan 1 file configurasi untuk semua plugin yang saya gunakan, yaitu `init.lua`. Tidak banyak yang saya gunakan karena sebagian besar tugas plugin sudah terwakili oleh plugin Copilot.

Namun untuk fitur yang lebih lengkap, kalian bisa kunjungi repositori asli dari [lzif](https://github.com/lzif/nvim) untuk melihat konfigurasi yang lebih lengkap dan fitur yang lebih banyak.

## Fitur
- NvimTreeToggle: (ctrl + n) untuk membuka dan menutup file explorer
- autoident: untuk mengatur indentasi secara otomatis sesuai dengan bahasa pemrograman yang digunakan
- Copilot plugin: untuk membantu dalam menulis kode dengan mendapatkan saran dari AI berdasarkan konteks kode yang sedang ditulis.

## Installasi
1. Clone repositori ini ke dalam direktori `~/.config/nvim`
```bash
git clone https://github.com/Rovikin/nvim ~/.config/nvim
```
2. Buka nvim dan jalankan perintah `:PackerSync` untuk menginstall semua plugin yang diperlukan
```bash
:PackerSync
```
3. Setelah proses installasi selesai, restart nvim untuk melihat perubahan yang telah dilakukan

## Setup Copilot Plugin

Untuk menggunakan Copilot plugin di Termux, kalian perlu memiliki akun GitHub.

Kemudian kalian bisa mengikuti langkah-langkah berikut untuk mengaktifkan Copilot di nvim:
1. Buka nvim dan jalankan perintah `:Copilot setup` untuk mengaktifkan Copilot plugin
```bash
:Copilot setup
```
2. Ikuti instruksi yang diberikan untuk menghubungkan akun GitHub kalian dengan Copilot plugin
3. Setelah proses setup selesai, kalian bisa mulai menggunakan Copilot untuk membantu dalam menulis kode dengan menggunakan AI. Kalian bisa menggunakan perintah `:Copilot` untuk melihat daftar perintah yang tersedia untuk menggunakan Copilot plugin.

4. Untuk shortcutnya saya menggunakan ctrl + j untuk menerima saran dari Copilot, kalian bisa mengubah shortcut tersebut sesuai dengan kebutuhan kalian dengan mengedit konfigurasi di file `init.lua` pada bagian setup Copilot plugin.

5. Untuk instruksi lengkap Plugin Copilot, kalian bisa kunjungi dokumentasi resmi dari plugin tersebut di [Copilot Plugin](https://github.com/github/copilot.vim).


## Kontribusi
Jika kalian ingin berkontribusi dalam pengembangan konfigurasi ini, silakan fork repositori utama di [lzif](https://github.com/lzif/nvim) dan buat pull request dengan perubahan yang kalian lakukan.

Terimakasih saya yang sebesar-besarnya untuk [lzif](https://github.com/lzif) yang sudah membuat konfigurasi ini, saya hanya melakukan beberapa perubahan sesuai dengan kebutuhan saya.
