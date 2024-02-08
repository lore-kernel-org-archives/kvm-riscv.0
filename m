From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 8 Feb 2024 18:41:11 +0100
Subject: Announcing RISC-V support for kvm-unit-tests
Message-ID: <20240208-d78f3ecdaf1c2c9237aa90bd@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi All,

I'm pleased to announce that the initial RISC-V port for kvm-unit-tests[1]
has been merged.  With the initial support we can begin writing SBI tests
which can be used for SBI implementation verification, as we've previously
proposed in a tech-prs call [2].  Any SBI implementation which supports
QEMU as a platform may be tested, e.g. OpenSBI, RustSBI, and KVM.  SBI
implementations which do not support QEMU, but do have bootloaders which
support EFI, will also be testable soon when the EFI support for RISC-V
kvm-unit-tests has been merged.

CPU validation tests may also already be written.  When CPU validation
tests are run on QEMU, then they will validate QEMU itself, which may
be useful for the development of new QEMU ISA extension support, as well
as for regression tests.  Additionally, on platforms where it's possible
to run Linux and KVM (e.g. QEMU, other emulators, or actual hardware with
the H extension), then tests may be written which validate KVM and guest
mode behavior (this latter test scope was the original purpose of
kvm-unit-tests, hence the 'kvm' in its name).  With minimal effort it
should be possible to use alternative KVM userspaces with KVM testing,
e.g. kvmtool instead of QEMU.  Finally, on hardware that supports KVM,
it's already possible to write virtualization micro-benchmarks.  After
the EFI support has been merged, then micro-benchmarks with scopes
beyond virtualization will also be possible.

Thanks,
drew

[1] https://gitlab.com/kvm-unit-tests/kvm-unit-tests
[2] https://lists.riscv.org/g/tech-prs/message/649

