From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 25 Nov 2024 10:40:56 +0100
Subject: [kvm-unit-tests PATCH v2 3/3] riscv: sbi: Add SSE extension tests
In-Reply-To: <362ddf23-283c-43e8-bfff-00ff971e8501@rivosinc.com>
References: <20241122140459.566306-1-cleger@rivosinc.com>
 <20241122140459.566306-4-cleger@rivosinc.com>
 <20241122-5e3fefbf68ba10f193470d6a@orel>
 <362ddf23-283c-43e8-bfff-00ff971e8501@rivosinc.com>
Message-ID: <20241125-dd673eb2a354159e4a7829bc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 09:55:47AM +0100, Cl?ment L?ger wrote:
> 
> 
> On 22/11/2024 17:34, Andrew Jones wrote:
> > On Fri, Nov 22, 2024 at 03:04:57PM +0100, Cl?ment L?ger wrote:
> >> Add SBI SSE extension tests for the following features:
> >> - Test attributes errors (invalid values, RO, etc)
> >> - Registration errors
> >> - Simple events (register, enable, inject)
> >> - Events with different priorities
> >> - Global events dispatch on different harts
> >> - Local events on all harts
> >>
> >> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> >> ---
> >>  riscv/Makefile      |   1 +
> >>  lib/riscv/asm/csr.h |   2 +
> >>  riscv/sbi-tests.h   |   4 +
> >>  riscv/sbi-sse.c     | 981 ++++++++++++++++++++++++++++++++++++++++++++
> >>  riscv/sbi.c         |   1 +
> >>  riscv/unittests.cfg |   4 +
> >>  6 files changed, 993 insertions(+)
> >>  create mode 100644 riscv/sbi-sse.c
> >>
> >> diff --git a/riscv/Makefile b/riscv/Makefile
> >> index e50621ad..768e1c25 100644
> >> --- a/riscv/Makefile
> >> +++ b/riscv/Makefile
> >> @@ -46,6 +46,7 @@ ifeq ($(ARCH),riscv32)
> >>  cflatobjs += lib/ldiv32.o
> >>  endif
> >>  cflatobjs += riscv/sbi-asm.o
> >> +cflatobjs += riscv/sbi-sse.o
> > 
> > We should figure out how to only link these files into
> > riscv/sbi.{flat,efi}
> 
> Hey drew, thansk for the review.
> 
> I'll check if this is possible to do that yeah.
> 
> > 
> >>  
> >>  ########################################
> >>  
> >> diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> >> index 16f5ddd7..06831380 100644
> >> --- a/lib/riscv/asm/csr.h
> >> +++ b/lib/riscv/asm/csr.h
> >> @@ -21,6 +21,8 @@
> >>  /* Exception cause high bit - is an interrupt if set */
> >>  #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> >>  
> >> +#define SSTATUS_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
> >> +
> >>  /* Exception causes */
> >>  #define EXC_INST_MISALIGNED	0
> >>  #define EXC_INST_ACCESS		1
> >> diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> >> index ce129968..2115acc6 100644
> >> --- a/riscv/sbi-tests.h
> >> +++ b/riscv/sbi-tests.h
> >> @@ -33,4 +33,8 @@
> >>  #define SBI_SUSP_TEST_HARTID	(1 << 2)
> >>  #define SBI_SUSP_TEST_MASK	7
> >>  
> >> +#ifndef __ASSEMBLY__
> >> +void check_sse(void);
> > 
> > We can just put this in riscv/sbi.c
> 
> sbi.c is already almost 1500 lines long, adding SSE would make it a 2500
> lines files. IMHO, it would be nice to keep it separated to keep it
> clean. But if you really have a strong opinion to incorporate that in
> sbi.c, I'll do that.

I meant just this prototype, 'void check_sse(void);'

Thanks,
drew

