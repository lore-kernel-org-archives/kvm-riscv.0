From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 3 Sep 2024 15:58:22 +0200
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Rename sbi ecall wrappers
In-Reply-To: <20240830155337.335534-4-andrew.jones@linux.dev>
References: <20240830155337.335534-4-andrew.jones@linux.dev>
Message-ID: <20240903-335afb7445c803c23e1f1297@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 05:53:38PM GMT, Andrew Jones wrote:
> Just some renaming to improve readability and also add another DBCN
> test to ensure we only write a single byte with write-byte. Use the
> "raw" ecall for that because sbi_dbcn_write_byte now takes a uint8_t.
> 
> Andrew Jones (2):
>   sbi: Rename __*_sbi_ecall to sbi_*
>   sbi: dbcn: Add write-byte test with more than byte given
> 
>  riscv/sbi.c | 48 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 18 deletions(-)
> 
> -- 
> 2.45.2
>

Adding the missing 'riscv' prefixes to the patches and queued
https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

