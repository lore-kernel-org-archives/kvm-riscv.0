From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 22 Oct 2022 11:15:47 +0200
Subject: [GIT PULL] KVM/riscv fixes for 6.1, take #1
In-Reply-To: <CAAhSdy30JYf3SjDaAm6LHTU-yD36Nb8=FYaPpECm68O8XFdBDg@mail.gmail.com>
References: <CAAhSdy30JYf3SjDaAm6LHTU-yD36Nb8=FYaPpECm68O8XFdBDg@mail.gmail.com>
Message-ID: <0851c9e1-c63d-fca5-7a9f-10c8f8bae289@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/21/22 09:56, Anup Patel wrote:
> Hi Paolo,
> 
> We have two fixes for 6.1:
> 1) Fix for compile error seen when RISCV_ISA_ZICBOM
>      is disabled. This fix touches code outside KVM RISC-V
>      but I am including this here since it was affecting KVM
>      compilation.
> 2) Fix for checking pending timer interrupt when RISC-V
>      Sstc extension is available.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>    Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.1-1
> 
> for you to fetch changes up to cea8896bd936135559253e9b23340cfa1cdf0caf:
> 
>    RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc (2022-10-21
> 11:52:45 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv fixes for 6.1, take #1
> 
> - Fix compilation without RISCV_ISA_ZICBOM
> - Fix kvm_riscv_vcpu_timer_pending() for Sstc
> 
> ----------------------------------------------------------------
> Andrew Jones (1):
>        RISC-V: Fix compilation without RISCV_ISA_ZICBOM
> 
> Anup Patel (1):
>        RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc
> 
>   arch/riscv/include/asm/cacheflush.h     |  8 -------
>   arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
>   arch/riscv/kvm/vcpu.c                   |  3 +++
>   arch/riscv/kvm/vcpu_timer.c             | 17 ++++++++++++--
>   arch/riscv/mm/cacheflush.c              | 38 ++++++++++++++++++++++++++++++
>   arch/riscv/mm/dma-noncoherent.c         | 41 ---------------------------------
>   6 files changed, 57 insertions(+), 51 deletions(-)

Pulled, thanks.

Paolo


