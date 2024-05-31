From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 16:55:37 +0530
Subject: [PATCH 0/2] KVM RISC-V HW IMSIC guest files
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
References: <20240411090639.237119-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3+q1aLgTro5N_UerXjaW7fTGxjpOPKkyR+-GMru-gZMw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 11, 2024 at 2:36?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series extends the HWACCEL and AUTO modes of AIA in-kernel irqchip
> to use HW IMSIC guest files whenever underlying host supports it.
>
> This series depends upon the "Linux RISC-V AIA support" series which
> is already queued for Linux-6.10.
> (Refer, https://lore.kernel.org/lkml/20240307140307.646078-1-apatel at ventanamicro.com/)
>
> These patches can also be found in the riscv_kvm_aia_hwaccel_v1 branch
> at: https://github.com/avpatel/linux.git
>
> Anup Patel (2):
>   RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
>   RISC-V: KVM: Use IMSIC guest files when available

Queued this series for Linux-6.11

Regards,
Anup

>
>  arch/riscv/include/asm/kvm_aia_aplic.h | 58 --------------------------
>  arch/riscv/include/asm/kvm_aia_imsic.h | 38 -----------------
>  arch/riscv/kvm/aia.c                   | 35 +++++++++-------
>  arch/riscv/kvm/aia_aplic.c             |  2 +-
>  arch/riscv/kvm/aia_device.c            |  2 +-
>  arch/riscv/kvm/aia_imsic.c             |  2 +-
>  6 files changed, 24 insertions(+), 113 deletions(-)
>  delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
>  delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
>
> --
> 2.34.1
>

