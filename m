From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 16:08:07 +0100
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: Add SUSP tests
In-Reply-To: <20241024124101.73405-5-andrew.jones@linux.dev>
References: <20241024124101.73405-5-andrew.jones@linux.dev>
Message-ID: <20241111-10022f0cc16c81ac6a39ee6b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 24, 2024 at 02:41:02PM +0200, Andrew Jones wrote:
> Add tests for the SBI SUSP extension.
> 
> Based-on: https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi
> 
> Andrew Jones (3):
>   riscv: Implement setjmp/longjmp
>   riscv: sbi: Clean up env checking
>   riscv: sbi: Add SUSP tests
> 
>  lib/riscv/asm/asm.h |   3 +
>  lib/riscv/asm/sbi.h |   1 +
>  lib/riscv/setjmp.S  |  50 +++++++
>  lib/setjmp.h        |   4 +
>  riscv/Makefile      |   1 +
>  riscv/sbi-asm.S     |  55 ++++++++
>  riscv/sbi-tests.h   |  19 +++
>  riscv/sbi.c         | 308 ++++++++++++++++++++++++++++++++++++++++----
>  8 files changed, 417 insertions(+), 24 deletions(-)
>  create mode 100644 lib/riscv/setjmp.S
> 
> -- 
> 2.47.0
>

Merged through riscv/sbi.

Thanks,
drew

