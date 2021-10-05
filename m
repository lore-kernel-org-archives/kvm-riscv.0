From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 5 Oct 2021 09:37:27 +0200
Subject: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
References: <mhng-1bfcbce2-3da3-4490-bcc5-45173ad84285@palmerdabbelt-glaptop>
Message-ID: <ea3a9bab-28f2-48e7-761e-b41d7bc7d0a5@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04/10/21 20:01, Palmer Dabbelt wrote:
> 
> Just to make sure we're on the same page here, I've got
> 
>  ?? commit 6c341a285912ddb2894ef793a58ad4f8462f26f4 (HEAD -> for-next)
>  ?? Merge: 08da1608a1ca 3f2401f47d29
>  ?? Author: Palmer Dabbelt <palmerdabbelt@google.com>
>  ?? Date:?? Mon Oct 4 10:12:44 2021 -0700
>  ?????? Merge tag 'for-riscv' of 
> https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next
>  ?????? H extension definitions, shared by the KVM and RISC-V trees.
>  ?????? * tag 'for-riscv' of 
> ssh://gitolite.kernel.org/pub/scm/virt/kvm/kvm: (301 commits)
>  ???????? RISC-V: Add hypervisor extension related CSR defines
>  ???????? KVM: selftests: Ensure all migrations are performed when test 
> is affined
>  ???????? KVM: x86: Swap order of CPUID entry "index" vs. "significant 
> flag" checks
>  ???????? ptp: Fix ptp_kvm_getcrosststamp issue for x86 ptp_kvm
>  ???????? x86/kvmclock: Move this_cpu_pvti into kvmclock.h
>  ???????? KVM: s390: Function documentation fixes
>  ???????? selftests: KVM: Don't clobber XMM register when read
>  ???????? KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR field mask issue
>  ???????? selftests: KVM: Explicitly use movq to read xmm registers
>  ???????? selftests: KVM: Call ucall_init when setting up in rseq_test
>  ???????? KVM: Remove tlbs_dirty
>  ???????? KVM: X86: Synchronize the shadow pagetable before link it
>  ???????? KVM: X86: Fix missed remote tlb flush in rmap_write_protect()
>  ???????? KVM: x86: nSVM: don't copy virt_ext from vmcb12
>  ???????? KVM: x86: nSVM: test eax for 4K alignment for GP errata 
> workaround
>  ???????? KVM: x86: selftests: test simultaneous uses of V_IRQ from L1 
> and L0
>  ???????? KVM: x86: nSVM: restore int_vector in svm_clear_vintr
>  ???????? kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
>  ???????? KVM: x86: nVMX: re-evaluate emulation_required on nested VM exit
>  ???????? KVM: x86: nVMX: don't fail nested VM entry on invalid guest 
> state if !from_vmentry
>  ???????? ...
> 
> into 
> ssh://git at gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git 
> for-next
> (I know that's kind of a confusing name, but it's what I've been using 
> as my short-term staging branch so I can do all my tests before saying 
> "it's on for-next").
> 
> If that looks OK I can make it a touch more official by putting into the 
> RISC-V tree.

Yes.  All of the patches in there, except the last, are already in 
Linus's tree.

Thank you,

Paolo


