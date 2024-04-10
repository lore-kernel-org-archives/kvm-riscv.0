From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 10 Apr 2024 09:20:43 +0200
Subject: [PATCH v4 09/15] RISC-V: KVM: Add perf sampling support for
 guests
In-Reply-To: <388ef032-7030-47b5-bba5-852b00de7382@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-10-atishp@rivosinc.com>
 <20240302-f9732d962e5f7c7760059f2e@orel>
 <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
 <20240405-de92b25fdc1ecf53770c49d9@orel>
 <388ef032-7030-47b5-bba5-852b00de7382@rivosinc.com>
Message-ID: <20240410-f1a4303dc73789aa6adbe730@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 09, 2024 at 05:11:31PM -0700, Atish Patra wrote:
> On 4/5/24 05:05, Andrew Jones wrote:
> > On Tue, Apr 02, 2024 at 01:33:10AM -0700, Atish Patra wrote:
> > ...
> > > > but it should be possible for the VMM to disable this extension in the
> > > > guest. We just need to change all the checks in KVM of the host's ISA
> > > > for RISCV_ISA_EXT_SSCOFPMF to checking the guest's ISA instead. Maybe
> > > > it's not worth it, though, if the guest PMU isn't useful without overflow.
> > > > But, sometimes it's nice to be able to disable stuff for debug and
> > > > workarounds.
> > > > 
> > > 
> > > As per my understanding, kvm_riscv_vcpu_isa_disable_allowed only returns
> > > true for those extensions which can be disabled architecturally.
> > 
> > I think kvm_riscv_vcpu_isa_disable_allowed can return true for any
> > extensions that KVM can guarantee won't be exposed in any way to the
> > guest. Extensions that cannot be disabled architecturally must return
> > false, since their instructions will still be present in the guest, even
> > if KVM doesn't want to expose them, but extensions which KVM emulates
> > can return true because KVM can choose not to emulate them. IIUC, sscofpmf
> > falls in this latter category.
> > 
> 
> hmm. The Sscofpmf is dependent on interrupt filtering via hvien and SBI PMU.
> So you are suggesting to toggle off the CSR_HVIEN bit for overflow interrupt

Yeah, this is what I was thinking.

> or do more granular disabling for privilege mode filtering in SBI PMU as
> well.
> 
> Beyond that we can't disable SBI PMU. Is that okay ? A guest can still cause
> counter overflow and interrupt the host. However, the guest won't get any
> interrupt as hvien is not set.
> 
> It can also still filter the events as that is tied with SBI PMU.
> 
> We can put more granular checks in SBI pmu but I am just wondering if it
> provides anything additional beyond just disabling the sscofpmf in device
> tree.

If it's too much of a code burden for something we're unlikely going to
want to do for anything other than debug (where removing the extension
from the device tree is likely sufficient), then that's another reason to
not allow disabling. Maybe we should write a comment above
kvm_riscv_vcpu_isa_disable_allowed which points how extensions end up
there, i.e. either KVM is powerless to completely hide it or we don't
want to maintain KVM code to completely hide it.

Thanks,
drew

