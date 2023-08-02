From: Sean Christopherson <seanjc@google.com>
Date: Wed, 2 Aug 2023 15:16:43 -0700
Subject: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
In-Reply-To: <cover.1690364259.git.haibo1.xu@intel.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
Message-ID: <ZMrVrXlvu/FJEayx@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023, Haibo Xu wrote:
> The sstc_timer selftest is used to validate Sstc timer functionality
> in a guest, which sets up periodic timer interrupts and check the
> basic interrupt status upon its receipt.
> 
> This KVM selftest was ported from aarch64 arch_timer and tested
> with Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> 
> Haibo Xu (4):
>   tools: riscv: Add header file csr.h
>   KVM: riscv: selftests: Add exception handling support
>   KVM: riscv: selftests: Add guest helper to get vcpu id
>   KVM: riscv: selftests: Add sstc_timer test

FYI, patch 4 will conflict with the in-flight guest printf changes[*], as will
reworking the existing arch_timer test.  My plan is to create an immutable tag
later this week (waiting to make sure nothing explodes).  I highly recommend basing
v2 on top of that.

[*] https://lore.kernel.org/all/20230729003643.1053367-1-seanjc at google.com

