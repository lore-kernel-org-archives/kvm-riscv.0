From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Jul 2024 08:40:52 -0500
Subject: [PATCH kvm-unit-tests] This patch adds a unit test for the debug
 console write() and write_byte() functions. It also fixes the virt_to_phys()
 function to return the offset address, not the PTE aligned address.
In-Reply-To: <20240703-sbi-dbcn-write-v1-1-13f08380d768@berkeley.edu>
References: <20240703-sbi-dbcn-write-v1-1-13f08380d768@berkeley.edu>
Message-ID: <20240704-86beeeb5968c9f23cc100963@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Cade,

The patch summary (the part that becomes the email subject line) should
be a concise phrase and not be longer than 75 characters. The rest of the
patch description goes in the commit message (line wrapping at 75). It
looks like you have all the text in the patch summary right now. Also,
the commit message should point out the motivation, approach, remaining
work etc., and it's a red flag when a patch has an "and also..." in its
commit message, as that implies it needs to be split. A single patch
should do a single thing. In this case I see an "and also virt_to_phys"
type of thing, but I don't see that change. The virt_to_phys() change
should be a separate patch and come before this patch, as this patch
needs the fixed virt_to_phys().

On Wed, Jul 03, 2024 at 08:43:44PM GMT, Cade Richard wrote:
> 
> 
> ---
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  riscv/run           |  1 +
>  lib/riscv/asm/sbi.h |  5 ++++
>  riscv/sbi.c         | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/riscv/run b/riscv/run
> index 73f2bf54..e4e39d74 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -30,6 +30,7 @@ fi
>  mach='-machine virt'
>  
>  command="$qemu -nodefaults -nographic -serial mon:stdio"
> +

Stray, unnecessary change. Please be sure your tree only contains the
changes you want to make before you commit and generate patches.

>  command+=" $mach $acc $firmware -cpu $processor "
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index d82a384d..4ae15879 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -12,6 +12,11 @@
>  #define SBI_ERR_ALREADY_STARTED		-7
>  #define SBI_ERR_ALREADY_STOPPED		-8
>  
> +#define DBCN_WRITE_TEST_STRING "DBCN_WRITE_TEST_STRING\n"
> +#define DBCN_READ_TEST_STRING "DBCN_READ_TEST_STRING\n"

This patch is only adding write tests so we don't need a read test string.

> +#define DBCN_WRITE_BYTE_TEST_BYTE 'a'
> +#define DBCN_WRITE_TEST_BYTE_FLAG "DBCN_WRITE_TEST_CHAR: "

"DBCN_WRITE_TEST_CHAR:" isn't a flag it's a prefix, so the define should
be named DBCN_WRITE_TEST_BYTE_PREFIX, but we don't need a define at all,
as it's only used in one place, so just puts() the string itself.

Also tab out the values of these symbols to line them up, i.e.

#define FOO	"FOO"
#define BAR	"BAR"

And the defines don't belong in asm/sbi.h. That header is for common sbi
support, not unit test stuff. Test strings are just for tests so the
defines should go directly into the test source (riscv/sbi.c).

> +
>  #ifndef __ASSEMBLY__
>  
>  enum sbi_ext_id {
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 762e9711..0fb7a300 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -7,6 +7,11 @@
>  #include <libcflat.h>
>  #include <stdlib.h>
>  #include <asm/sbi.h>
> +#include <asm/csr.h>
> +#include <asm/io.h>
> +#include <asm/sbi.h>
> +
> +#define INVALID_RW_ADDR 0x0000000002000000;

No need for the leading 0's. We can't be sure this will be invalid on all
platforms. The platform needs to be able to configure stuff like this.
We use environment variables for that. We can provide a QEMU value as a
default though.

>  
>  static void help(void)
>  {
> @@ -112,6 +117,72 @@ static void check_base(void)
>  	report_prefix_pop();
>  }
>  
> +static void check_dbcn(void)
> +{
> +	
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
> +
> +	report_prefix_pop();

We don't want to pop 'dbcn' here. We're still in the dbcn tests.

> +
> +	report_prefix_push("write");
> +	
> +	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
> +	base_addr_hi = 0x0;
> +	base_addr_lo = virt_to_phys((void *) &DBCN_WRITE_TEST_STRING);
                                            ^ remove the space here
> +
> +	do {
> +		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);

The pointer and number of bytes should be changing by the amount written
when we need additional writes in order to finish the string.

> +	} while (ret.value != num_bytes || ret.error != SBI_SUCCESS) ;

If ret.error isn't success than we should break from the loop, otherwise 
we could loop forever on a failing write and the report() check below
would be useless.

> +	report(SBI_SUCCESS == ret.error, "write success");
> +    report(ret.value == num_bytes, "correct number of bytes written");

This line isn't using a tab. Please run the kernel's checkpatch script on
the patch before posting. Also this test is wrong because the last
ret.value may be less than num_bytes and we know we wrote a total of
num_bytes since we looped until we did.

> +
> +	base_addr_lo = INVALID_RW_ADDR;
> +	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
> +    report(SBI_ERR_INVALID_PARAM == ret.error, "invalid parameter: address");

spaces instead of tab and I prefer variable first in conditions.

> +
> +	report_prefix_pop();
> +	
> +	report_prefix_push("read");
> +
> +/*	num_bytes = strlen(DBCN_READ_TEST_STRING);
> +	char *actual = malloc(num_bytes);
> +	base_addr_hi = 0x0;
> +	base_addr_lo = virt_to_phys(( void *) actual);
> +
> +	do {
> +		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_READ, num_bytes, base_addr_lo, base_addr_hi);
> +	} while (ret.value != num_bytes || ret.error != SBI_SUCCESS) ;
> +	report(SBI_SUCCESS == ret.error, "read success");
> +    report(ret.value == num_bytes, "correct number of bytes read");
> +	report(strcmp(actual,DBCN_READ_TEST_STRING) == 0, "correct bytes read");
> +*/

All this commented out stuff above should not be in the patch. A TODO
comment with a plan for a test is fine, but a bunch of commented out
untested code is just clutter. Also, the commit message says its adding
write and write_byte, nothing about read, so read shouldn't be here at
all.

> +	base_addr_lo = INVALID_RW_ADDR;
> +    ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_READ, num_bytes, base_addr_lo, base_addr_hi);
> +    report(SBI_ERR_INVALID_PARAM == ret.error, "invalid parameter: address");

need to use tabs and variable first in conditions

> +
> +	report_prefix_pop();
> +	
> +	report_prefix_push("write_byte");
> +
> +	puts(DBCN_WRITE_TEST_BYTE_FLAG);
> +	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, (u8) DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
                                                                    ^ no
					space and we can put the cast on
					the define instead of here

> +	puts("\n");
> +    report(SBI_SUCCESS == ret.error, "write success");
> +    report(0 == ret.value, "expected ret.value");

need to use tabs and variable first in conditions

> +
> +	report_prefix_pop();
> +}
> +
>  int main(int argc, char **argv)
>  {
>

As this test isn't actually confirming that the writes were actually
written then the commit message should explain that it's expected the
output of the test be inspected to ensure the test strings and bytes
are written.

Thanks,
drew

