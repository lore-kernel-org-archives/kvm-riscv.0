From: Atish Patra <Atish.Patra@wdc.com>
Date: Tue, 1 Dec 2020 01:06:05 +0000
Subject: [PATCH 0/6] Add SBI v0.2 support for KVM
In-Reply-To: <CAAhSdy0hrKNwOA4428Vf4mf32gZSw1cKiSXhhXB1s==yq7jEpA@mail.gmail.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
 <CAAhSdy0hrKNwOA4428Vf4mf32gZSw1cKiSXhhXB1s==yq7jEpA@mail.gmail.com>
Message-ID: <47dc03619f0299480282e30bea560b600e673c50.camel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-27 at 13:44 +0530, Anup Patel wrote:
> On Mon, Aug 3, 2020 at 11:29 PM Atish Patra <atish.patra@wdc.com>
> wrote:
> > 
> > The Supervisor Binary Interface(SBI) specification[1] now defines a
> > base extension that provides extendability to add future extensions
> > while maintaining backward compatibility with previous versions.
> > The new version is defined as 0.2 and older version is marked as
> > 0.1.
> > 
> > This series adds following features to RISC-V Linux KVM.
> > 1. Adds support for SBI v0.2 in KVM
> > 2. SBI Hart state management extension (HSM) in KVM
> > 3. Ordered booting of guest vcpus in guest Linux
> > 
> > This series depends on the base kvm support series[2].
> > 
> > Guest kernel needs to also support SBI v0.2 and HSM extension in
> > Kernel
> > to boot multiple vcpus. Linux kernel supports both starting v5.7.
> > In absense of that, guest can only boot 1vcpu.
> > 
> > [1]  
> > https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> > [2]  
> > http://lists.infradead.org/pipermail/linux-riscv/2020-July/001028.html
> > 
> > Atish Patra (6):
> > RISC-V: Add a non-void return for sbi v02 functions
> > RISC-V: Mark the existing SBI v0.1 implementation as legacy
> > RISC-V: Reorganize SBI code by moving legacy SBI to its own file
> > RISC-V: Add SBI v0.2 base extension
> > RISC-V: Add v0.1 replacement SBI extensions defined in v02
> > RISC-V: Add SBI HSM extension in KVM
> > 
> > arch/riscv/include/asm/kvm_vcpu_sbi.h |? 32 +++++
> > arch/riscv/include/asm/sbi.h????????? |? 17 ++-
> > arch/riscv/kernel/sbi.c?????????????? |? 32 ++---
> > arch/riscv/kvm/Makefile?????????????? |?? 4 +-
> > arch/riscv/kvm/vcpu.c???????????????? |? 19 +++
> > arch/riscv/kvm/vcpu_sbi.c???????????? | 194 ++++++++++++-----------
> > ---
> > arch/riscv/kvm/vcpu_sbi_base.c??????? |? 73 ++++++++++
> > arch/riscv/kvm/vcpu_sbi_hsm.c???????? | 109 +++++++++++++++
> > arch/riscv/kvm/vcpu_sbi_legacy.c????? | 129 +++++++++++++++++
> > arch/riscv/kvm/vcpu_sbi_replace.c???? | 136 ++++++++++++++++++
> > 10 files changed, 619 insertions(+), 126 deletions(-)
> > create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
> > 
> > --
> > 2.24.0
> > 
> 
> Please implement the SBI SRST extension in your series.
> 

Yeah. I will update the series as per new SRST extension.

> Also, the PATCH1 can be merged separately so I would suggest
> you to send this patch separately.
> 

Sure will do that.

> Regards,
> Anup

-- 
Regards,
Atish
