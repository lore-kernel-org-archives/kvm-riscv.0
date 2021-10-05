From: Palmer Dabbelt <palmerdabbelt@google.com>
Date: Mon, 04 Oct 2021 21:44:01 -0700 (PDT)
Subject: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <CAAhSdy1vQg+UKxquZiQG32YFmU95xYc_4Yb_VUA0nd=t8vRu-A@mail.gmail.com>
Message-ID: <mhng-a3959620-f7e2-4ece-96bc-72fec3e58629@palmerdabbelt-glaptop>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 04 Oct 2021 21:22:36 PDT (-0700), anup at brainfault.org wrote:
> On Mon, Oct 4, 2021 at 11:31 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Mon, 04 Oct 2021 01:58:28 PDT (-0700), pbonzini at redhat.com wrote:
>> > On 27/09/21 13:39, Anup Patel wrote:
>> >> This series adds initial KVM RISC-V support. Currently, we are able to boot
>> >> Linux on RV64/RV32 Guest with multiple VCPUs.
>> >>
>> >> Key aspects of KVM RISC-V added by this series are:
>> >> 1. No RISC-V specific KVM IOCTL
>> >> 2. Loadable KVM RISC-V module supported
>> >> 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
>> >> 4. Both RV64 and RV32 host supported
>> >> 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
>> >> 6. KVM ONE_REG interface for VCPU register access from user-space
>> >> 7. PLIC emulation is done in user-space
>> >> 8. Timer and IPI emuation is done in-kernel
>> >> 9. Both Sv39x4 and Sv48x4 supported for RV64 host
>> >> 10. MMU notifiers supported
>> >> 11. Generic dirtylog supported
>> >> 12. FP lazy save/restore supported
>> >> 13. SBI v0.1 emulation for KVM Guest available
>> >> 14. Forward unhandled SBI calls to KVM userspace
>> >> 15. Hugepage support for Guest/VM
>> >> 16. IOEVENTFD support for Vhost
>> >>
>> >> Here's a brief TODO list which we will work upon after this series:
>> >> 1. KVM unit test support
>> >> 2. KVM selftest support
>> >> 3. SBI v0.3 emulation in-kernel
>> >> 4. In-kernel PMU virtualization
>> >> 5. In-kernel AIA irqchip support
>> >> 6. Nested virtualizaiton
>> >> 7. ..... and more .....
>> >
>> > Looks good, I prepared a tag "for-riscv" at
>> > https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and
>> > you can use it to send me a pull request.
>>
>> Thanks.  I'm assuming "you" there is Anup?
>>
>> Just to make sure we're on the same page here, I've got
>>
>>     commit 6c341a285912ddb2894ef793a58ad4f8462f26f4 (HEAD -> for-next)
>>     Merge: 08da1608a1ca 3f2401f47d29
>>     Author: Palmer Dabbelt <palmerdabbelt@google.com>
>>     Date:   Mon Oct 4 10:12:44 2021 -0700
>>
>>         Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next
>>
>>         H extension definitions, shared by the KVM and RISC-V trees.
>>
>>         * tag 'for-riscv' of ssh://gitolite.kernel.org/pub/scm/virt/kvm/kvm: (301 commits)
>>           RISC-V: Add hypervisor extension related CSR defines
>>           KVM: selftests: Ensure all migrations are performed when test is affined
>>           KVM: x86: Swap order of CPUID entry "index" vs. "significant flag" checks
>>           ptp: Fix ptp_kvm_getcrosststamp issue for x86 ptp_kvm
>>           x86/kvmclock: Move this_cpu_pvti into kvmclock.h
>>           KVM: s390: Function documentation fixes
>>           selftests: KVM: Don't clobber XMM register when read
>>           KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR field mask issue
>>           selftests: KVM: Explicitly use movq to read xmm registers
>>           selftests: KVM: Call ucall_init when setting up in rseq_test
>>           KVM: Remove tlbs_dirty
>>           KVM: X86: Synchronize the shadow pagetable before link it
>>           KVM: X86: Fix missed remote tlb flush in rmap_write_protect()
>>           KVM: x86: nSVM: don't copy virt_ext from vmcb12
>>           KVM: x86: nSVM: test eax for 4K alignment for GP errata workaround
>>           KVM: x86: selftests: test simultaneous uses of V_IRQ from L1 and L0
>>           KVM: x86: nSVM: restore int_vector in svm_clear_vintr
>>           kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
>>           KVM: x86: nVMX: re-evaluate emulation_required on nested VM exit
>>           KVM: x86: nVMX: don't fail nested VM entry on invalid guest state if !from_vmentry
>>           ...
>>
>> into ssh://git at gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
>> (I know that's kind of a confusing name, but it's what I've been using
>> as my short-term staging branch so I can do all my tests before saying
>> "it's on for-next").
>>
>> If that looks OK I can make it a touch more official by putting into the
>> RISC-V tree.
>>
>> > I look forward to the test support. :)  Would be nice to have selftest
>> > support already in 5.16, since there are a few arch-independent
>> > selftests that cover the hairy parts of the MMU.
>>
>> Me too ;).
>>
>> I'm happy to add some KVM-related stuff to my pre-push test set, just
>> LMK if there's anything specific I should be looking in to.
>
> Thanks Palmer, I will ping you once I have basic kvm-selftest patches
> ready for RISC-V.

Sonuds good.  I was just rewriting history (oops) because I forgot a 
SOB, so the hash is a bit different but it the merge is still the tip of 
palmer/for-next.

73698660f17c Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next

