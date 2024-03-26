From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Mar 2024 09:37:39 +0530
Subject: [PATCH 0/2] KVM RISC-V APLIC fixes
In-Reply-To: <20240321085041.1955293-1-apatel@ventanamicro.com>
References: <20240321085041.1955293-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1jAjGJR=+ZtfLpfzgctJ4cA==nCXJ0FEDBF_vJLNJBWA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 21, 2024 at 2:20?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Few fixes for KVM RISC-V in-kernel APLIC emulation which were discovered
> during Linux AIA driver patch reviews.
>
> These patches can also be found in the riscv_kvm_aplic_fixes_v1
> branch at: https://github.com/avpatel/linux.git
>
> Anup Patel (2):
>   RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
>   RISC-V: KVM: Fix APLIC in_clrip[x] read emulation

Queued this series for Linux-6.9 fixes.

Thanks,
Anup

>
>  arch/riscv/kvm/aia_aplic.c | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
>
> --
> 2.34.1
>

