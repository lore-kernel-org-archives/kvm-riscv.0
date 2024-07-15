From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 15 Jul 2024 17:33:29 -0500
Subject: [PATCH kvm-unit-tests v2] riscv: sbi: debug console write tests
In-Reply-To: <20240706-sbi-dbcn-write-tests-v2-1-a5dc6a749f4a@berkeley.edu>
References: <20240706-sbi-dbcn-write-tests-v2-1-a5dc6a749f4a@berkeley.edu>
Message-ID: <20240715-d79b2446d8d2ef2751739652@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 06, 2024 at 04:55:46PM GMT, Cade Richard wrote:
>

Needs commit message

> 
> ---

Need to remove the above ---

> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
> Changes in v2:
> - Added prefix pop to exit dbcn tests
> - Link to v1: https://lore.kernel.org/r/20240706-sbi-dbcn-write-tests-v1-1-b754e51699f8 at berkeley.edu
> ---
>  lib/riscv/asm/sbi.h |  7 +++++++
>  riscv/sbi.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index d82a384d..c5fa84ae 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -18,6 +18,7 @@ enum sbi_ext_id {
>  	SBI_EXT_BASE = 0x10,
>  	SBI_EXT_HSM = 0x48534d,
>  	SBI_EXT_SRST = 0x53525354,
> +	SBI_EXT_DBCN = 0x4442434E,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -37,6 +38,12 @@ enum sbi_ext_hsm_fid {
>  	SBI_EXT_HSM_HART_SUSPEND,
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
> index 762e9711..18646842 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -7,6 +7,10 @@
>  #include <libcflat.h>
>  #include <stdlib.h>
>  #include <asm/sbi.h>
> +#include <asm/io.h>
> +
> +#define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
> +#define DBCN_WRITE_BYTE_TEST_BYTE	(u8)'a'
>  
>  static void help(void)
>  {
> @@ -19,6 +23,11 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
>  	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
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
> @@ -112,6 +121,56 @@ static void check_base(void)
>  	report_prefix_pop();
>  }
>  
> +static void check_dbcn(void)
> +{
> +	

Stray blank line here

> +	struct sbiret ret;
> +	unsigned long num_bytes, base_addr_lo, base_addr_hi;
> +
> +	report_prefix_push("dbcn");
> +	
> +	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_DBCN);
> +	if (!ret.value) {
> +		report_skip("DBCN extension unavailable");
> +		report_prefix_pop();
> +		return;
> +	}

We should provide a

 long sbi_probe(int ext)
 {
     struct sbiret ret;

     ret = sbi_ecall(SBI_EXT_BASE_PROBE_EXT, ext, 0, 0, 0, 0, 0, 0);
     assert(!ret.error);

     return ret.value;
 }

in lib/riscv/sbi.c and use that everywhere we need to do checks like
these.

> +
> +	report_prefix_push("write");
> +
> +	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
> +	base_addr_hi = 0x0;

We shouldn't assume that the high part of the address is zero. We
can set it to whatever the high part of virt_to_phys(...) is.

> +	base_addr_lo = virt_to_phys((void *) &DBCN_WRITE_TEST_STRING);
                                            ^ remove this space
> +
> +	do {
> +		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
> +		num_bytes -= ret.value;
> +		base_addr_lo += ret.value;
> +	} while (num_bytes != 0 && ret.error == SBI_SUCCESS) ;
                                                            ^ remove this
							    space
add a blank line here

> +	report(SBI_SUCCESS == ret.error, "write success");

nit: write this as 'ret.error == SBI_SUCCESS'

> +	report(ret.value == num_bytes, "correct number of bytes written");

ret.value may not be num_bytes since we may have issued more than one
SBI call and ret.value is only whatever the last call wrote. This check
isn't actually necessary since we have the SBI_SUCCESS check already
and we can't get SBI_SUCCESS without num_bytes == 0. It may be interesting
to know how many SBI calls were made (for successful writes and failed
writes). We could add a counter to the loop and then a report_info here.

> +
> +	// Bytes are read from memory and written to the console

Use /* */ as described in the kernel's coding style documentation.

> +	if (env_or_skip("INVALID_READ_ADDR")) {
> +		base_addr_lo = strtol(getenv("INVALID_READ_ADDR"), NULL, 0);
> +		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);

num_bytes is likely zero right now so it may not matter what the address
is. The user specified address doesn't have to be 32-bit only so it should
also set hi.

> +		report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address");
> +	};
         ^ unnecessary ;
> +
> +	report_prefix_pop();
> +	
> +	report_prefix_push("write_byte");
> +
> +	puts("DBCN_WRITE TEST CHAR: ");
> +	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, (u8)DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
                                                                ^ this
					           cast isn't necessary
> +	puts("\n");
> +	report(ret.error == SBI_SUCCESS, "write success");
> +	report(ret.value == 0, "expected ret.value");
> +
> +	report_prefix_pop();
> +	report_prefix_pop();

We should add a comment somewhere pointing out that there's also a read
function, but there's no easy way to test that. If we're optimistic that
we'll eventually come up with a way, then the comment can contain a TODO
tag.

> +}
> +
>  int main(int argc, char **argv)
>  {
>  
> @@ -122,6 +181,7 @@ int main(int argc, char **argv)
>  
>  	report_prefix_push("sbi");
>  	check_base();
> +	check_dbcn();
>  
>  	return report_summary();
>  }
> 
> ---
> base-commit: 40e1fd76ffc80b1d43214e31a023aaf087ece987
> change-id: 20240706-sbi-dbcn-write-tests-42289f1391ed
> 
> Best regards,
> -- 
> Cade Richard <cade.richard@berkeley.edu>
>

Thanks,
drew

