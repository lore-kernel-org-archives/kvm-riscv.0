From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 9 Aug 2023 11:26:36 +0800
Subject: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
In-Reply-To: <87y1ilpz3m.wl-maz@kernel.org>
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org>
Message-ID: <CAJve8onZuOHkAUVY3=QeBPMx5n2F1fGgn57rPp7MB1Q5=vXasA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 8, 2023 at 7:12?PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 07 Aug 2023 04:48:33 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Marc, Hi Oliver,
> >
> > On Tue, Jul 25, 2023 at 2:05?PM Haibo Xu <haibo1.xu@intel.com> wrote:
> > >
> > > KVM_GET_REG_LIST will dump all register IDs that are available to
> > > KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> > > regression issue during VM migration.
> > >
> > > Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> > > of the code as common test framework that can be shared by riscv.
> > >
> > > Patch 8 move reject_set check logic to a function so as to check for
> > > different errno for different registers.
> > > Patch 9 move finalize_vcpu back to run_test so that riscv can implement
> > > its specific operation.
> > > Patch 10 change to do the get/set operation only on present-blessed list.
> > > Patch 11 add the skip_set facilities so that riscv can skip set operation
> > > on some registers.
> > > Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
> > > patch 13 added the corresponding kselftest for checking possible
> > > register regressions.
> > >
> > > The get-reg-list kvm selftest was ported from aarch64 and tested with
> > > Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> > >
> > > ---
> > > Changed since v5:
> > >   * Rebase to v6.5-rc3
> > >   * Minor fix for Andrew's comments
> > >
> > > Andrew Jones (7):
> > >   KVM: arm64: selftests: Replace str_with_index with strdup_printf
> > >   KVM: arm64: selftests: Drop SVE cap check in print_reg
> > >   KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
> > >   KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
> > >   KVM: arm64: selftests: Delete core_reg_fixup
> > >   KVM: arm64: selftests: Split get-reg-list test code
> > >   KVM: arm64: selftests: Finish generalizing get-reg-list
> > >
> > > Haibo Xu (6):
> > >   KVM: arm64: selftests: Move reject_set check logic to a function
> > >   KVM: arm64: selftests: Move finalize_vcpu back to run_test
> > >   KVM: selftests: Only do get/set tests on present blessed list
> > >   KVM: selftests: Add skip_set facility to get_reg_list test
> > >   KVM: riscv: Add KVM_GET_REG_LIST API support
> > >   KVM: riscv: selftests: Add get-reg-list test
> >
> > Are you okay for this series to go through the KVM RISC-V tree ?
>
> Sure, seems fine from my point of view. But please put it on an
> immutable topic branch so that we can also merge it in the arm64 tree,
> should we need to resolve any conflicts.
>

Hi Marc,

Thanks for your review!

Which topic branch do you prefer or suggest to use?
I can do a rebase on it and fix any potential conflicts.

Regards,
Haibo

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

