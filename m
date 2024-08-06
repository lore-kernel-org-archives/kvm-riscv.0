From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 6 Aug 2024 09:34:15 +0200
Subject: [kvm-unit-tests PATCH v3] riscv: sbi: add debug console write
 unit tests
In-Reply-To: <CAMr6HdANC356u=ScEHgEbcYpb7zij6tscZTcK=OCEcj5YqP0Fw@mail.gmail.com>
References: <CAMr6HdANC356u=ScEHgEbcYpb7zij6tscZTcK=OCEcj5YqP0Fw@mail.gmail.com>
Message-ID: <20240806-1fd7cb1430cc116a87be144e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Cade,

Please make sure your patch submission tool(s) don't also send HTML.

On Mon, Aug 05, 2024 at 09:34:35PM GMT, Cade Richard wrote:
> Added a unit test for the RISC-V SBI debug console write() and write_byte()
> functions. The output of the tests must be inspected manually to verify
> that the correct bytes are written. For write(), the expected output is
> 'DBCN_WRITE_TEST_STRING'. For write_byte(), the expected output is 'a'.
> 
> Changes in v3:
>  - Fixed formatting issues
>  - Removed redundant test for number of bytes written
>  - Changed high part of address in write test
>  - Added a comment regarding read tests

The v3 changelog should go under the '---' which is below your sign-off
since we don't want that in the final commit message.

> 
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index d82a384d..f2cb882a 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -18,6 +18,7 @@ enum sbi_ext_id {
>   SBI_EXT_BASE = 0x10,
>   SBI_EXT_HSM = 0x48534d,
>   SBI_EXT_SRST = 0x53525354,
> + SBI_EXT_DBCN = 0x4442434E,
>  };
> 
>  enum sbi_ext_base_fid {
> @@ -37,6 +38,12 @@ enum sbi_ext_hsm_fid {
>   SBI_EXT_HSM_HART_SUSPEND,
>  };
> 
> +enum sbi_ext_dbcn_fid {
> + SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> + SBI_EXT_DBCN_CONSOLE_READ,
> + SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
> +};
> +
>  struct sbiret {
>   long error;
>   long value;
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 762e9711..f74783b6 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -7,6 +7,14 @@
>  #include <libcflat.h>
>  #include <stdlib.h>
>  #include <asm/sbi.h>
> +#include <asm/io.h>

You should base new versions on the latest upstream. riscv/sbi.c has
changed quite a bit now that we've merged TIME tests.

> +
> +#define DBCN_WRITE_TEST_STRING "DBCN_WRITE_TEST_STRING\n"
> +#define DBCN_WRITE_BYTE_TEST_BYTE (u8)'a'
> +#include <asm/io.h>

The three lines above need to be removed. You somehow made a mess in your
editor and then somehow didn't notice while prereviewing your patch before
posting.

> +
> +#define DBCN_WRITE_TEST_STRING "DBCN_WRITE_TEST_STRING\n"
> +#define DBCN_WRITE_BYTE_TEST_BYTE (u8)'a'
> 
>  static void help(void)
>  {
> @@ -19,6 +27,11 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned
> long arg0)
>   return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
>  }
> 
> +static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0,
> unsigned long arg1, unsigned long arg2)
> +{
> + return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
> +}

You're missing all the required indentation (maybe because the mail
got sent as HTML and I'm looking at a text extraction?). But did you
check the patch using the kernel's checkpatch (which we'll likely be
incorporating directly into this project [1])

[1] https://lore.kernel.org/all/20240726070456.467533-7-npiggin at gmail.com/

> +
>  static bool env_or_skip(const char *env)
>  {
>   if (!getenv(env)) {
> @@ -112,6 +125,61 @@ static void check_base(void)
>   report_prefix_pop();
>  }
> 
> +/* Only the write functionality is tested here. There seems to be no easy

Comments need the opening /* wing on its own line.  

> + way to test the read functionality without reworking the k-u-t framework.
> */
> +static void check_dbcn(void)
> +{
> +
> + struct sbiret ret;
> + unsigned long num_bytes, base_addr_lo, base_addr_hi;
> +
> + report_prefix_push("dbcn");
> +
> + if (!sbi_probe(SBI_EXT_DBCN)) {
> + report_skip("DBCN extension unavailable");
> + report_prefix_pop();
> + return;
> + }
> +
> + report_prefix_push("write");
> +
> + num_bytes = strlen(DBCN_WRITE_TEST_STRING);
> + base_addr_hi = virt_to_phys(((void *)&DBCN_WRITE_TEST_STRING) >>
> __riscv_xlen);

The shift needs to be done after the conversion to the physical address.
The virtual address will never be wider than xlen bits. But, I doubled
checked virt_to_phys() and see that I neglected to ensure we could have
up to 34-bit physical addresses on 32-bit by implementing it to return
an unsigned long instead of a phys_addr_t (so we can't have greater
than xlen physical addresses here either...) I need to fix that, but
we can still write the code here correctly, i.e. interpret 'phys' as
meaning phys_addr_t and make sure we do the shifting at the right point
and also add (unsigned long) casts here and to the assignment below.

> + base_addr_lo = virt_to_phys((void *)&DBCN_WRITE_TEST_STRING);
> + int num_calls = 0;

nit: I'd put this up at the top with the rest of the declarations.

> +
> + do {
> + ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes,
> base_addr_lo, base_addr_hi);
> + num_bytes -= ret.value;
> + base_addr_lo += ret.value;
> + num_calls++;
> + } while (num_bytes != 0 && ret.error == SBI_SUCCESS);
> +
> + report(SBI_SUCCESS == ret.error, "write success");

nit: I pointed out in the last review that I prefer the variable before
the constant in comparisons, ret.error == SBI_SUCCESS.


> + report_info("%d sbi calls made", num_calls);
> +
> + /* Bytes are read from memory and written to the console */
> + if (env_or_skip("INVALID_READ_ADDR")) {
> + base_addr_lo = strtol(getenv("INVALID_READ_ADDR"), NULL, 0);
> + base_addr_hi = strtol(getenv("INVALID_READ_ADDR"), NULL, 0) >>
> __riscv_xlen;

We should be using strtoull() since this is a phys_addr_t.

  phys_addr_t p = strtoull(getenv("INVALID_READ_ADDR"), NULL, 0);
  base_addr_lo = (unsigned long)p;
  base_addr_hi = (unsigned long)(p >> __riscv_xlen);

> + ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes,

I pointed out in the last review that num_bytes is most likely zero right
now. So you're not likely testing anything. You need to reset num_bytes to
some nonzero value for this test, or just pass in a number directly, e.g.

 __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, 1, base_addr_lo, base_addr_hi)

> base_addr_lo, base_addr_hi);
> + report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address");
> + }
> +
> + report_prefix_pop();
> +
> + report_prefix_push("write_byte");
> +
> + puts("DBCN_WRITE TEST CHAR: ");
> + ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
> DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
> + puts("\n");
> + report(ret.error == SBI_SUCCESS, "write success");
> + report(ret.value == 0, "expected ret.value");
> +
> + report_prefix_pop();
> + report_prefix_pop();
> +}
> +
>  int main(int argc, char **argv)
>  {
> 
> @@ -122,6 +190,7 @@ int main(int argc, char **argv)
> 
>   report_prefix_push("sbi");
>   check_base();
> + check_dbcn();
> 
>   return report_summary();
>  }

Thanks,
drew

