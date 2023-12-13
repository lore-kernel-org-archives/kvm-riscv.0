From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Dec 2023 18:12:27 +0100
Subject: [PATCH 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
In-Reply-To: <CAAhSdy0ic5ERKR8Q2VdSOzNSgV22omE_7qPN0fNcUTxawZRn4w@mail.gmail.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
 <CAAhSdy0ic5ERKR8Q2VdSOzNSgV22omE_7qPN0fNcUTxawZRn4w@mail.gmail.com>
Message-ID: <20231213-2de73d20a178c32f9a716cf4@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 09:59:22PM +0530, Anup Patel wrote:
> On Fri, Dec 1, 2023 at 12:19?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > SBI extension UAPI is currently almost the same as the ISA extension
> > UAPI. This series closes the remaining gap by ensuring when an SBI
> > extension is not available that its register returns ENOENT when
> > accessed by userspace. We also drop the SBI multi registers from
> > get-reg-list (ISA multi registers aren't there either) and make
> > several improvements to the get-reg-list kselftest.
> >
> > This series is based on Anup's riscv_kvm_more_exts_v1 branch.
> > Based-on: 20231128145357.413321-1-apatel at ventanamicro.com
> >
> > Thanks,
> > drew
> >
> > Andrew Jones (6):
> >   RISC-V: KVM: Don't add SBI multi regs in get-reg-list
> >   KVM: riscv: selftests: Drop SBI multi registers
> >   RISC-V: KVM: Make SBI uapi consistent with ISA uapi
> 
> I am not able to locate this patch on the mailing list as well as on
> patchwork.
> 
> Can you re-send this series ?

Sent a v2 rebased on the latest kvm-riscv/riscv_kvm_queue rather
than your riscv_kvm_more_exts_v1 branch. Hopefully this one makes
it to the M/L.

Thanks,
drew

> 
> Regards,
> Anup
> 
> >   KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
> >   KVM: riscv: selftests: Use register subtypes
> >   RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
> >
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h         |  10 +-
> >  arch/riscv/kvm/vcpu_onereg.c                  |  53 +---
> >  arch/riscv/kvm/vcpu_sbi.c                     |  75 +++--
> >  arch/riscv/kvm/vcpu_sbi_replace.c             |   2 +-
> >  .../selftests/kvm/include/kvm_util_base.h     |   1 +
> >  .../selftests/kvm/include/riscv/processor.h   |  40 +--
> >  .../selftests/kvm/lib/riscv/processor.c       |   4 +-
> >  .../selftests/kvm/riscv/get-reg-list.c        | 274 ++++++++++++------
> >  8 files changed, 281 insertions(+), 178 deletions(-)
> >
> > --
> > 2.43.0
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

