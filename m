From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:21:09 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: sbi: Add support to test HSM
 extension
In-Reply-To: <20240810175744.166503-1-jamestiotio@gmail.com>
References: <20240810175744.166503-1-jamestiotio@gmail.com>
Message-ID: <20240812-ad8171c2d4e3bf1355e85326@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 11, 2024 at 01:57:41AM GMT, James Raphael Tiovalen wrote:
> This patch series adds support for testing all 4 functions of the HSM
> extension as defined in the RISC-V SBI specification. The first 2
> patches add some helper routines to prepare for the HSM test, while the
> last patch adds the actual test for the HSM extension.
> 
> James Raphael Tiovalen (3):
>   riscv: sbi: Add IPI extension support
>   riscv: sbi: Add HSM extension functions
>   riscv: sbi: Add tests for HSM extension
> 
>  riscv/Makefile      |   7 +-
>  lib/riscv/asm/sbi.h |  23 ++++
>  lib/riscv/sbi.c     |  15 +++
>  riscv/sbi-asm.S     |  38 ++++++
>  riscv/sbi.c         | 285 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 365 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/sbi-asm.S
> 
> --
> 2.43.0
>

Hi James,

When you send v2, please base on riscv/sbi, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fsbi

Thanks,
drew

