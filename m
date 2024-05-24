From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 24 May 2024 17:44:54 +0800
Subject: [PATCH v3 0/4] Add Svadu Extension Support
In-Reply-To: <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com> <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
Message-ID: <CAMWQL2jPE-EFGymzAy5WqiC=E-Zp684cT-JvK+6cfk12Yhs5ww@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On Fri, May 24, 2024 at 5:18?PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Yong-Xuan,
>
> On 02/11/2023 13:01, Yong-Xuan Wang wrote:
> > Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
> > patch set adds support to enable Svadu extension for both host and guest
> > OS.
> >
> > ---
> > v3:
> > - fix the control bit name to ADUE in PATCH1 and PATCH3
> > - update get-reg-list in PATCH4
> >
> > v2:
> > - add Co-developed-by: in PATCH1
> > - use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
> > - update dt-binding
> >
> > Yong-Xuan Wang (4):
> >    RISC-V: Detect and Enable Svadu Extension Support
> >    dt-bindings: riscv: Add Svadu Entry
> >    RISC-V: KVM: Add Svadu Extension Support for Guest/VM
> >    KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt
> >
> >   .../devicetree/bindings/riscv/extensions.yaml  |  6 ++++++
> >   arch/riscv/include/asm/csr.h                   |  1 +
> >   arch/riscv/include/asm/hwcap.h                 |  1 +
> >   arch/riscv/include/asm/pgtable.h               |  6 ++++++
> >   arch/riscv/include/uapi/asm/kvm.h              |  1 +
> >   arch/riscv/kernel/cpufeature.c                 |  1 +
> >   arch/riscv/kvm/vcpu.c                          |  3 +++
> >   arch/riscv/kvm/vcpu_onereg.c                   |  1 +
> >   .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
> >   9 files changed, 38 insertions(+)
> >
>
> Will you spin a new version for this?
>
> Thanks,
>
> Alex
>

Yes, I have finished the new version. I would send out the patchset as
soon as possible.

Regards,
Yong-Xuan

