From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2024 17:20:00 +0530
Subject: [PATCH 0/2] KVM RISC-V APLIC fixes
In-Reply-To: <f44de7d9-e03d-483d-96d3-76c63158061d@gmail.com>
References: <20240321085041.1955293-1-apatel@ventanamicro.com> <f44de7d9-e03d-483d-96d3-76c63158061d@gmail.com>
Message-ID: <CAAhSdy1HnzB5T0G3dEfuVX1LHCMy6H4B1paQyCKC-iXTJ_Nf=w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 22, 2024 at 5:05?PM Bing Fan <hptsfb@gmail.com> wrote:
>
>
> Hi,
>
>
> As you mentioned as below, riscv's aia patch in
> https://github.com/avpatel/linux.git
>
> Why is this series of patches not merged into upstream?

This will be sent as part of Linux-6.9-rcX fixes (after 1-2 weeks).

Regards,
Anup

>
>
> ? 2024/3/21 16:50, Anup Patel ??:
> > Few fixes for KVM RISC-V in-kernel APLIC emulation which were discovered
> > during Linux AIA driver patch reviews.
> >
> > These patches can also be found in the riscv_kvm_aplic_fixes_v1
> > branch at: https://github.com/avpatel/linux.git
> >
> > Anup Patel (2):
> >    RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
> >    RISC-V: KVM: Fix APLIC in_clrip[x] read emulation
> >
> >   arch/riscv/kvm/aia_aplic.c | 37 +++++++++++++++++++++++++++++++------
> >   1 file changed, 31 insertions(+), 6 deletions(-)
> >

