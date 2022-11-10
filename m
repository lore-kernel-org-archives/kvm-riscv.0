From: Robert Hoo <robert.hu@linux.intel.com>
Date: Thu, 10 Nov 2022 15:31:42 +0800
Subject: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
In-Reply-To: <20221102231911.3107438-33-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-33-seanjc@google.com>
Message-ID: <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that
> printks
> use consistent formatting across common x86, Intel, and AMD code.  In
> addition to providing consistent print formatting, using
> KBUILD_MODNAME,
> e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV
> and
> SGX and ...) as technologies without generating weird messages, and
> without causing naming conflicts with other kernel code, e.g. "SEV:
> ",
> "tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM
> subsystems.
> 
> Opportunistically move away from printk() for prints that need to be
> modified anyways, e.g. to drop a manual "kvm: " prefix.
> 
> Opportunistically convert a few SGX WARNs that are similarly modified
> to
> WARN_ONCE; in the very unlikely event that the WARNs fire, odds are
> good
> that they would fire repeatedly and spam the kernel log without
> providing
> unique information in each print.
> 
> Note, defining pr_fmt yields undesirable results for code that uses
> KVM's
> printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing
> problem
> as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
> wrappers is relatively limited in KVM x86 code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/cpuid.c            |  1 +
>  arch/x86/kvm/debugfs.c          |  2 ++
>  arch/x86/kvm/emulate.c          |  1 +
>  arch/x86/kvm/hyperv.c           |  1 +
>  arch/x86/kvm/i8254.c            |  4 ++--
>  arch/x86/kvm/i8259.c            |  4 +++-
>  arch/x86/kvm/ioapic.c           |  1 +
>  arch/x86/kvm/irq.c              |  1 +
>  arch/x86/kvm/irq_comm.c         |  7 +++---
>  arch/x86/kvm/kvm_onhyperv.c     |  1 +
>  arch/x86/kvm/lapic.c            |  8 +++----
>  arch/x86/kvm/mmu/mmu.c          |  6 ++---
>  arch/x86/kvm/mmu/page_track.c   |  1 +
>  arch/x86/kvm/mmu/spte.c         |  4 ++--
>  arch/x86/kvm/mmu/spte.h         |  4 ++--
>  arch/x86/kvm/mmu/tdp_iter.c     |  1 +
>  arch/x86/kvm/mmu/tdp_mmu.c      |  1 +
>  arch/x86/kvm/mtrr.c             |  1 +
>  arch/x86/kvm/pmu.c              |  1 +
>  arch/x86/kvm/smm.c              |  1 +
>  arch/x86/kvm/svm/avic.c         |  2 +-
>  arch/x86/kvm/svm/nested.c       |  2 +-
>  arch/x86/kvm/svm/pmu.c          |  2 ++
>  arch/x86/kvm/svm/sev.c          |  1 +
>  arch/x86/kvm/svm/svm.c          | 10 ++++-----
>  arch/x86/kvm/svm/svm_onhyperv.c |  1 +
>  arch/x86/kvm/svm/svm_onhyperv.h |  4 ++--
>  arch/x86/kvm/vmx/evmcs.c        |  1 +
>  arch/x86/kvm/vmx/evmcs.h        |  4 +---
>  arch/x86/kvm/vmx/nested.c       |  3 ++-
>  arch/x86/kvm/vmx/pmu_intel.c    |  5 +++--
>  arch/x86/kvm/vmx/posted_intr.c  |  2 ++
>  arch/x86/kvm/vmx/sgx.c          |  5 +++--
>  arch/x86/kvm/vmx/vmcs12.c       |  1 +
>  arch/x86/kvm/vmx/vmx.c          | 40 ++++++++++++++++---------------
> --
>  arch/x86/kvm/vmx/vmx_ops.h      |  4 ++--
>  arch/x86/kvm/x86.c              | 28 ++++++++++++-----------
>  arch/x86/kvm/xen.c              |  1 +
>  38 files changed, 97 insertions(+), 70 deletions(-)
> 
After this patch set, still find some printk()s left in arch/x86/kvm/*,
consider clean all of them up?

arch/x86/kvm/lapic.c:1215:		printk(KERN_ERR "TODO:
unsupported delivery mode %x\n",
arch/x86/kvm/lapic.c:1506:		printk(KERN_ERR "Local APIC
read with len = %x, "
arch/x86/kvm/lapic.c:2586:		printk(KERN_ERR "malloc apic
regs error for vcpu %x\n",
arch/x86/kvm/ioapic.h:95:		printk(KERN_EMERG "assertion
failed %s: %d: %s\n",	\
arch/x86/kvm/ioapic.c:614:		printk(KERN_WARNING "ioapic:
wrong length %d\n", len);
arch/x86/kvm/ioapic.c:641:		printk(KERN_WARNING "ioapic:
Unsupported size %d\n", len);
arch/x86/kvm/mmu/mmu.c:1652:			printk(KERN_ERR "%s: %p
%llx\n", __func__,
arch/x86/kvm/svm/svm.c:3450:		printk(KERN_ERR "%s: unexpected
exit_int_info 0x%x "
arch/x86/kvm/vmx/posted_intr.c:322:				printk(
KERN_INFO
arch/x86/kvm/vmx/posted_intr.c:343:			printk(KERN_INF
O "%s: failed to update PI IRTE\n",
arch/x86/kvm/vmx/vmx.c:6507:			printk(KERN_WARNING
"%s: Breaking out of NMI-blocked "
arch/x86/kvm/x86.c:13027:		printk(KERN_INFO "irq bypass
consumer (token %p) unregistration"


