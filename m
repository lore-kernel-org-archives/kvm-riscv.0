From: Sean Christopherson <seanjc@google.com>
Date: Mon, 29 Apr 2024 13:45:21 -0700
Subject: [PATCH 00/18] KVM: selftests: Clean up x86's DT initialization
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <171442343194.161918.3828509492626949358.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 14 Mar 2024 16:26:19 -0700, Sean Christopherson wrote:
> The vast majority of this series is x86 specific, and aims to clean up the
> core library's handling of descriptor tables and segments.  Currently, the
> library (a) waits until vCPUs are created to allocate per-VM assets, and
> (b) forces tests to opt-in to allocate the structures needed to handler
> exceptions, which has result in some rather odd tests, and makes it
> unnecessarily difficult to debug unexpected exceptions.
> 
> [...]

Applied to kvm-x86 selftests_utils (I had already pushed stuff to "selftests",
so the name is less than awesome).

Other KVM maintainers, I also created tags/kvm-x86-selftests-utils if you want
to pull this into your tree to avoid later merge conflicts with the
kvm_util_base.h => kvm_util.h rename.  I don't expect to push anything else to
the branch, but never say never. 

Note, this branch+tag also has the _GNU_SOURCE change, and the global pseudo-RNG
series ("thank yous" incoming), i.e. it's hopefuly a one stop shop for all your
6.10 selftests needs!

[01/18] Revert "kvm: selftests: move base kvm_util.h declarations to kvm_util_base.h"
        https://github.com/kvm-x86/linux/commit/2b7deea3ec7c
[02/18] KVM: sefltests: Add kvm_util_types.h to hold common types, e.g. vm_vaddr_t
        https://github.com/kvm-x86/linux/commit/f54884f93898
[03/18] KVM: selftests: Move GDT, IDT, and TSS fields to x86's kvm_vm_arch
        https://github.com/kvm-x86/linux/commit/3a085fbf8228
[04/18] KVM: selftests: Fix off-by-one initialization of GDT limit
        https://github.com/kvm-x86/linux/commit/0d95817e0753
[05/18] KVM: selftests: Move platform_info_test's main assert into guest code
        https://github.com/kvm-x86/linux/commit/53635ec253c0
[06/18] KVM: selftests: Rework platform_info_test to actually verify #GP
        https://github.com/kvm-x86/linux/commit/dec79eab2b48
[07/18] KVM: selftests: Explicitly clobber the IDT in the "delete memslot" testcase
        https://github.com/kvm-x86/linux/commit/61c3cffd4cbf
[08/18] KVM: selftests: Move x86's descriptor table helpers "up" in processor.c
        https://github.com/kvm-x86/linux/commit/b62c32c532cd
[09/18] KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/d8c63805e4e5
[10/18] KVM: selftests: Init IDT and exception handlers for all VMs/vCPUs on x86
        https://github.com/kvm-x86/linux/commit/c1b9793b45d5
[11/18] KVM: selftests: Map x86's exception_handlers at VM creation, not vCPU setup
        https://github.com/kvm-x86/linux/commit/44c93b277269
[12/18] KVM: selftests: Allocate x86's GDT during VM creation
        https://github.com/kvm-x86/linux/commit/2a511ca99493
[13/18] KVM: selftests: Drop superfluous switch() on vm->mode in vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/1051e29cb915
[14/18] KVM: selftests: Fold x86's descriptor tables helpers into vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/23ef21f58cf8
[15/18] KVM: selftests: Allocate x86's TSS at VM creation
        https://github.com/kvm-x86/linux/commit/a2834e6e0b98
[16/18] KVM: selftests: Add macro for TSS selector, rename up code/data macros
        https://github.com/kvm-x86/linux/commit/f18ef97fc602
[17/18] KVM: selftests: Init x86's segments during VM creation
        https://github.com/kvm-x86/linux/commit/0f53a0245068
[18/18] KVM: selftests: Drop @selector from segment helpers
        https://github.com/kvm-x86/linux/commit/b093f87fd195

--
https://github.com/kvm-x86/linux/tree/next

