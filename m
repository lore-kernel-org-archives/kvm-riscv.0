From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 15 Sep 2023 12:27:59 +0530
Subject: [PATCH v5 0/7] Risc-V Kvm Smstateen
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
Message-ID: <CAK9=C2VF0Q=sZn48fhqOCY5jBq8OR-YyJOrh6AREsYhUnivcVA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 10:10?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> This series adds support to detect the Smstateen extension for both, the
> host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
> interface and the vcpu context save/restore.
>
> The motivation behind Smstateen from the spec
> (https://github.com/riscv/riscv-state-enable):
> "The implementation of optional RISC-V extensions has the potential to open
> covert channels between separate user threads, or between separate guest OSes
> running under a hypervisor. The problem occurs when an extension adds processor
> state---usually explicit registers, but possibly other forms of state---that
> the main OS or hypervisor is unaware of (and hence won?t context-switch) but
> that can be modified/written by one user thread or guest OS and perceived/
> examined/read by another."
>
> Changes in v5:
> - Rebased on latest linux master
>
> Changes in v4:
> - Update commit description for patch 1
> - Rebase to kvm_riscv_queue
> - Add reviewed-by tag
>
> Changes in v3:
> - Move DT bindings change to a separate patch
> - Move senvcfg/sstateen0 save/restore to separate function
>
> Changes in v2:
> - Add smstaeen description in riscv/extensions.yaml
> - Avoid line wrap at 80 chars
>
> Mayuresh Chitale (7):
>   RISC-V: Detect Smstateen extension
>   dt-bindings: riscv: Add smstateen entry
>   RISC-V: KVM: Add kvm_vcpu_config
>   RISC-V: KVM: Enable Smstateen accesses
>   RISCV: KVM: Add senvcfg context save/restore
>   RISCV: KVM: Add sstateen0 context save/restore
>   RISCV: KVM: Add sstateen0 to ONE_REG

Queued this series for Linux-6.7

Thanks,
Anup

>
>  .../devicetree/bindings/riscv/extensions.yaml |  6 ++
>  arch/riscv/include/asm/csr.h                  | 18 +++++
>  arch/riscv/include/asm/hwcap.h                |  1 +
>  arch/riscv/include/asm/kvm_host.h             | 18 +++++
>  arch/riscv/include/uapi/asm/kvm.h             | 10 +++
>  arch/riscv/kernel/cpufeature.c                |  1 +
>  arch/riscv/kvm/vcpu.c                         | 70 +++++++++++++++----
>  arch/riscv/kvm/vcpu_onereg.c                  | 41 +++++++++++
>  8 files changed, 152 insertions(+), 13 deletions(-)
>
> --
> 2.34.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

