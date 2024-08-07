From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 7 Aug 2024 13:36:33 +0200
Subject: [PATCH kvm-unit-tests] riscv: sbi: add dbcn write test
In-Reply-To: <20240806-sbi-dbcn-write-test-v1-1-7f198bb55525@berkeley.edu>
References: <20240806-sbi-dbcn-write-test-v1-1-7f198bb55525@berkeley.edu>
Message-ID: <20240807-2c3b28a78c80c6db80a80588@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 06, 2024 at 10:51:54PM GMT, Cade Richard wrote:
> 
> 
> ---
> Added a unit test for the RISC-V SBI debug console write() and write_byte() functions. The output of the tests must be inspected manually to verify that the correct bytes are written. For write(), the expected output is 'DBCN_WRITE_TEST_STRING'. For write_byte(), the expected output is 'a'.
> 
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  lib/riscv/asm/sbi.h |  7 ++++++
>  riscv/sbi.c         | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 73ab5438..47e91025 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -19,6 +19,7 @@ enum sbi_ext_id {
>  	SBI_EXT_TIME = 0x54494d45,
>  	SBI_EXT_HSM = 0x48534d,
>  	SBI_EXT_SRST = 0x53525354,
> +	SBI_EXT_DBCN = 0x4442434E,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -42,6 +43,12 @@ enum sbi_ext_time_fid {
>  	SBI_EXT_TIME_SET_TIMER = 0,
>  };
>  
> +enum sbi_ext_dbcn_fid {
> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> +	SBI_EXT_DBCN_CONSOLE_READ,
> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 2438c497..61993f08 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -15,6 +15,10 @@
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>  #include <asm/timer.h>
> +#include <asm/io.h>
> +
> +#define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
> +#define DBCN_WRITE_BYTE_TEST_BYTE	(u8)'a'
>  
>  static void help(void)
>  {
> @@ -32,6 +36,11 @@ static struct sbiret __time_sbi_ecall(unsigned long stime_value)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
>  }
>  
> +static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long arg1, unsigned long arg2)
> +{
> +	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
> +}
> +
>  static bool env_or_skip(const char *env)
>  {
>  	if (!getenv(env)) {
> @@ -248,6 +257,62 @@ static void check_time(void)
>  	report_prefix_pop();
>  }
>  
> +static void check_dbcn(void)
> +{
> +	

I still see whitespace issues, like this blank line here that has spaces,
which I pointed out before. And there are several more blank lines with
spaces too.

> +	struct sbiret ret;
> +	unsigned long num_bytes, base_addr_lo, base_addr_hi;
> +	int num_calls = 0;
> +	
> +	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
> +	phys_addr_t p = virt_to_phys((void *)&DBCN_WRITE_TEST_STRING);
> +	base_addr_lo = (unsigned long)p;
> +	base_addr_hi = (unsigned long)(p >> __riscv_xlen);

This doesn't compile for 64-bit. We get

riscv/sbi.c: In function 'check_dbcn':
riscv/sbi.c:270:42: error: right shift count >= width of type [-Werror=shift-count-overflow]
  270 |         base_addr_hi = (unsigned long)(p >> __riscv_xlen);
      |                                          ^~
riscv/sbi.c:298:50: error: right shift count >= width of type [-Werror=shift-count-overflow]
  298 |                 base_addr_hi = (unsigned long)(p >> __riscv_xlen);
      |                                                  ^~
cc1: all warnings being treated as errors
make: *** [<builtin>: riscv/sbi.o] Error 1

So I guess you didn't test with 64-bit? You should at least test with
both 32-bit and 64-bit on QEMU, and, ideally, also test both on KVM and
also 64-bit EFI on QEMU.

I just tried 32-bit KVM and see that the DBCN write test fails the
'write success' test. That may be a KVM bug.

Thanks,
drew

