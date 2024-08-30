From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 17:53:38 +0200
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Rename sbi ecall wrappers
Message-ID: <20240830155337.335534-4-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just some renaming to improve readability and also add another DBCN
test to ensure we only write a single byte with write-byte. Use the
"raw" ecall for that because sbi_dbcn_write_byte now takes a uint8_t.

Andrew Jones (2):
  sbi: Rename __*_sbi_ecall to sbi_*
  sbi: dbcn: Add write-byte test with more than byte given

 riscv/sbi.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

-- 
2.45.2


