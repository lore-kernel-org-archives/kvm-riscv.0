From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:52 +0000
Subject: [PATCH 00/15] KVM: x86: Introduce new ioctl KVM_TRANSLATE2
Message-ID: <20240910152207.38974-1-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a new ioctl KVM_TRANSLATE2, which expands on
KVM_TRANSLATE. It is required to implement Hyper-V's
HvTranslateVirtualAddress hyper-call as part of the ongoing effort to
emulate HyperV's Virtual Secure Mode (VSM) within KVM and QEMU. The hyper-
call requires several new KVM APIs, one of which is KVM_TRANSLATE2, which
implements the core functionality of the hyper-call. The rest of the
required functionality will be implemented in subsequent series.

Other than translating guest virtual addresses, the ioctl allows the
caller to control whether the access and dirty bits are set during the
page walk. It also allows specifying an access mode instead of returning
viable access modes, which enables setting the bits up to the level that
caused a failure. Additionally, the ioctl provides more information about
why the page walk failed, and which page table is responsible. This
functionality is not available within KVM_TRANSLATE, and can't be added
without breaking backwards compatiblity, thus a new ioctl is required.

The ioctl was designed to facilitate as many other use cases as possible
apart from VSM. The error codes were intentionally chosen to be broad
enough to avoid exposing architecture specific details. Even though
HvTranslateVirtualAddress only really needs one flag to set the accessed
and dirty bits whenever possible, that was split into several flags so
that future users can chose more gradually when these bits should be set.
Furthermore, as much information as possible is provided to the caller.

The patch series includes selftests for the ioctl, as well as fuzzy
testing on random garbage guest page table entries. All previously passing
KVM selftests and KVM unit tests still pass.

Series overview:
- 1: Document the new ioctl
- 2-11: Update the page walker in preparation
- 12-14: Implement the ioctl
- 15: Implement testing

This series, alongside the series by Nicolas Saenz Julienne [1]
introducing the core building blocks for VSM and the accompanying QEMU
implementation [2], is capable of booting Windows Server 2019.

Both series are also available on GitHub [3].

[1] https://lore.kernel.org/linux-hyperv/20240609154945.55332-1-nsaenz at amazon.com/
[2] https://github.com/vianpl/qemu/tree/vsm/next
[3] https://github.com/vianpl/linux/tree/vsm/next

Best,
Nikolas

Nikolas Wipper (15):
  KVM: Add API documentation for KVM_TRANSLATE2
  KVM: x86/mmu: Abort page walk if permission checks fail
  KVM: x86/mmu: Introduce exception flag for unmapped GPAs
  KVM: x86/mmu: Store GPA in exception if applicable
  KVM: x86/mmu: Introduce flags parameter to page walker
  KVM: x86/mmu: Implement PWALK_SET_ACCESSED in page walker
  KVM: x86/mmu: Implement PWALK_SET_DIRTY in page walker
  KVM: x86/mmu: Implement PWALK_FORCE_SET_ACCESSED in page walker
  KVM: x86/mmu: Introduce status parameter to page walker
  KVM: x86/mmu: Implement PWALK_STATUS_READ_ONLY_PTE_GPA in page walker
  KVM: x86: Introduce generic gva to gpa translation function
  KVM: Introduce KVM_TRANSLATE2
  KVM: Add KVM_TRANSLATE2 stub
  KVM: x86: Implement KVM_TRANSLATE2
  KVM: selftests: Add test for KVM_TRANSLATE2

 Documentation/virt/kvm/api.rst                | 131 ++++++++
 arch/x86/include/asm/kvm_host.h               |  18 +-
 arch/x86/kvm/hyperv.c                         |   3 +-
 arch/x86/kvm/kvm_emulate.h                    |   8 +
 arch/x86/kvm/mmu.h                            |  10 +-
 arch/x86/kvm/mmu/mmu.c                        |   7 +-
 arch/x86/kvm/mmu/paging_tmpl.h                |  80 +++--
 arch/x86/kvm/x86.c                            | 123 ++++++-
 include/linux/kvm_host.h                      |   6 +
 include/uapi/linux/kvm.h                      |  33 ++
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/x86_64/kvm_translate2.c     | 310 ++++++++++++++++++
 virt/kvm/kvm_main.c                           |  41 +++
 13 files changed, 724 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86_64/kvm_translate2.c

-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


