From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Sep 2024 14:04:47 +0530
Subject: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
In-Reply-To: <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
References: <CAAhSdy05BXUZu6BNUoDWoEVd_YiM0Dpqg=t5WYUX7+cacnO2Hg@mail.gmail.com>
 <mhng-1e3d83bb-a7f4-4fa7-8cfa-2550835026de@palmer-ri-x1c9>
Message-ID: <CAAhSdy08j_noBGi2CRf0oLBxFnmk983W24oQezmdg1pw6pFksQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 20, 2024 at 1:53?PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Wed, 21 Aug 2024 07:43:20 PDT (-0700), anup at brainfault.org wrote:
> > Hi Palmer,
> >
> > On Fri, Jul 26, 2024 at 2:19?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> >>
> >> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> >> bit. When the PTE A/D bits need to be set, Svade extension intdicates that
> >> a related page fault will be raised. In contrast, the Svadu extension
> >> supports hardware updating of PTE A/D bits. This series enables Svade and
> >> Svadu extensions for both host and guest OS.
> >>
> >> Regrading the mailing thread[1], we have 4 possible combinations of
> >> these extensions in the device tree, the default hardware behavior for
> >> these possibilities are:
> >> 1) Neither Svade nor Svadu present in DT => It is technically
> >>    unknown whether the platform uses Svade or Svadu. Supervisor
> >>    software should be prepared to handle either hardware updating
> >>    of the PTE A/D bits or page faults when they need updated.
> >> 2) Only Svade present in DT => Supervisor must assume Svade to be
> >>    always enabled.
> >> 3) Only Svadu present in DT => Supervisor must assume Svadu to be
> >>    always enabled.
> >> 4) Both Svade and Svadu present in DT => Supervisor must assume
> >>    Svadu turned-off at boot time. To use Svadu, supervisor must
> >>    explicitly enable it using the SBI FWFT extension.
> >>
> >> The Svade extension is mandatory and the Svadu extension is optional in
> >> RVA23 profile. Platforms want to take the advantage of Svadu can choose
> >> 3. Those are aware of the profile can choose 4, and Linux won't get the
> >> benefit of svadu until the SBI FWFT extension is available.
> >>
> >> [1] https://lore.kernel.org/linux-kernel/20240527-e9845c06619bca5cd285098c at orel/T/#m29644eb88e241ec282df4ccd5199514e913b06ee
> >>
> >> ---
> >> v8:
> >> - fix typo in PATCH1 (Samuel)
> >> - use the new extension validating API in PATCH1 (Cl?ment)
> >> - update the dtbinding in PATCH2 (Samuel, Conor)
> >> - add PATCH4 to fix compile error in get-reg-list test.
> >>
> >> v7:
> >> - fix alignment in PATCH1
> >> - update the dtbinding in PATCH2 (Conor, Jessica)
> >>
> >> v6:
> >> - reflect the platform's behavior by riscv_isa_extension_available() and
> >>   update the the arch_has_hw_pte_young() in PATCH1 (Conor, Andrew)
> >> - update the dtbinding in PATCH2 (Alexandre, Andrew, Anup, Conor)
> >> - update the henvcfg condition in PATCH3 (Andrew)
> >> - check if Svade is allowed to disabled based on arch_has_hw_pte_young()
> >>   in PATCH3
> >>
> >> v5:
> >> - remove all Acked-by and Reviewed-by (Conor, Andrew)
> >> - add Svade support
> >> - update the arch_has_hw_pte_young() in PATCH1
> >> - update the dtbinding in PATCH2 (Alexandre, Andrew)
> >> - check the availibility of Svadu for Guest/VM based on
> >>   arch_has_hw_pte_young() in PATCH3
> >>
> >> v4:
> >> - fix 32bit kernel build error in PATCH1 (Conor)
> >> - update the status of Svadu extension to ratified in PATCH2
> >> - add the PATCH4 to suporrt SBI_FWFT_PTE_AD_HW_UPDATING for guest OS
> >> - update the PATCH1 and PATCH3 to integrate with FWFT extension
> >> - rebase PATCH5 on the lastest get-reg-list test (Andrew)
> >>
> >> v3:
> >> - fix the control bit name to ADUE in PATCH1 and PATCH3
> >> - update get-reg-list in PATCH4
> >>
> >> v2:
> >> - add Co-developed-by: in PATCH1
> >> - use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
> >> - update dt-binding
> >>
> >> Yong-Xuan Wang (5):
> >>   RISC-V: Add Svade and Svadu Extensions Support
> >>   dt-bindings: riscv: Add Svade and Svadu Entries
> >>   RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
> >>   KVM: riscv: selftests: Fix compile error
> >>   KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list
> >>     test
> >>
> >>  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
> >>  arch/riscv/Kconfig                            |  1 +
> >>  arch/riscv/include/asm/csr.h                  |  1 +
> >>  arch/riscv/include/asm/hwcap.h                |  2 ++
> >>  arch/riscv/include/asm/pgtable.h              | 13 ++++++++-
> >>  arch/riscv/include/uapi/asm/kvm.h             |  2 ++
> >>  arch/riscv/kernel/cpufeature.c                | 12 ++++++++
> >>  arch/riscv/kvm/vcpu.c                         |  4 +++
> >>  arch/riscv/kvm/vcpu_onereg.c                  | 15 ++++++++++
> >>  .../selftests/kvm/riscv/get-reg-list.c        | 16 ++++++++---
> >>  10 files changed, 89 insertions(+), 5 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >
> > Let me know if this series can be taken through the KVM RISC-V tree.
> > I can provide you with a shared tag as well.
>
> I think the patchwork bot got confused by patch 4 going to fixes?  It
> says this was merged.
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> if you still want to take it, otherwise just LMK and I'll pick it up.
>

I already sent KVM RISC-V PR for 6.12 which has been merged
as well. Please take this series (except PATCH4) through the
RISC-V tree.

Thanks,
Anup

