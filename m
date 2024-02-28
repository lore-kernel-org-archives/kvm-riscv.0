From: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Feb 2024 14:40:20 -0800
Subject: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
In-Reply-To: <170900037528.3692126.18029642068469384283.b4-ty@google.com>
References: <20240223004258.3104051-1-seanjc@google.com> <170900037528.3692126.18029642068469384283.b4-ty@google.com>
Message-ID: <Zd-2VK2kvMr_t1jx@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024, Sean Christopherson wrote:
> On Thu, 22 Feb 2024 16:42:47 -0800, Sean Christopherson wrote:
> > Add basic SEV and SEV-ES smoke tests.  Unlike the intra-host migration tests,
> > this one actually runs a small chunk of code in the guest.
> > 
> > Unless anyone strongly objects to the quick and dirty approach I've taken for
> > SEV-ES, I'll get all of this queued for 6.9 soon-ish.
> > 
> > As for _why_ I added the quick-and-dirty SEV-ES testcase, I have a series to
> > cleanup __svm_sev_es_vcpu_run(), and found out that apparently I have a version
> > of OVMF that doesn't quite have to the right <something> for SEV-ES, and so I
> > could even get a "real" VM to reach KVM_RUN.  I assumed (correctly, yay!) that
> > hacking together a selftest would be faster than figuring out what firmware
> > magic I am missing.
> > 
> > [...]
> 
> Applied to kvm-x86 selftests, thanks!
> 
> [01/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
>         https://github.com/kvm-x86/linux/commit/309d1ad7b6ff
> [02/11] KVM: selftests: Make sparsebit structs const where appropriate
>         https://github.com/kvm-x86/linux/commit/6077c3ce4021
> [03/11] KVM: selftests: Add a macro to iterate over a sparsebit range
>         https://github.com/kvm-x86/linux/commit/8811565ff68e
> [04/11] KVM: selftests: Add support for allocating/managing protected guest memory
>         https://github.com/kvm-x86/linux/commit/29e749e8faff
> [05/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
>         https://github.com/kvm-x86/linux/commit/1e3af7cf984a
> [06/11] KVM: selftests: Explicitly ucall pool from shared memory
>         https://github.com/kvm-x86/linux/commit/5ef7196273b6
> [07/11] KVM: selftests: Allow tagging protected memory in guest page tables
>         https://github.com/kvm-x86/linux/commit/a8446cd81de8
> [08/11] KVM: selftests: Add library for creating and interacting with SEV guests
>         https://github.com/kvm-x86/linux/commit/f3ff1e9b2f9c
> [09/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
>         https://github.com/kvm-x86/linux/commit/0837ddb51f9b
> [10/11] KVM: selftests: Add a basic SEV smoke test
>         https://github.com/kvm-x86/linux/commit/5101f1e27683
> [11/11] KVM: selftests: Add a basic SEV-ES smoke test
>         https://github.com/kvm-x86/linux/commit/f3750b0c7f6e

FYI, the hashes changed due to a force push to squash a bug in a different
series.

[1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
      https://github.com/kvm-x86/linux/commit/126190379c57
[2/11] KVM: selftests: Make sparsebit structs const where appropriate
      https://github.com/kvm-x86/linux/commit/35f50c91c43e
[3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
      https://github.com/kvm-x86/linux/commit/57e19f057758
[4/11] KVM: selftests: Add support for allocating/managing protected guest memory
      https://github.com/kvm-x86/linux/commit/cd8eb2913205
[5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
      https://github.com/kvm-x86/linux/commit/d210eebb51a2
[6/11] KVM: selftests: Explicitly ucall pool from shared memory
      https://github.com/kvm-x86/linux/commit/31e00dae72fd
[7/11] KVM: selftests: Allow tagging protected memory in guest page tables
      https://github.com/kvm-x86/linux/commit/bf47e87c65be
[8/11] KVM: selftests: Add library for creating and interacting with SEV guests
      https://github.com/kvm-x86/linux/commit/bdceeebcddb8
[9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
      https://github.com/kvm-x86/linux/commit/8b174eb9d289
[10/11] KVM: selftests: Add a basic SEV smoke test
      https://github.com/kvm-x86/linux/commit/faa0d7027de3
[11/11] KVM: selftests: Add a basic SEV-ES smoke test
      https://github.com/kvm-x86/linux/commit/974ba6f0e595

