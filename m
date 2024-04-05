From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 5 Apr 2024 14:05:04 +0200
Subject: [PATCH v4 09/15] RISC-V: KVM: Add perf sampling support for
 guests
In-Reply-To: <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-10-atishp@rivosinc.com>
 <20240302-f9732d962e5f7c7760059f2e@orel>
 <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
Message-ID: <20240405-de92b25fdc1ecf53770c49d9@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 02, 2024 at 01:33:10AM -0700, Atish Patra wrote:
...
> > but it should be possible for the VMM to disable this extension in the
> > guest. We just need to change all the checks in KVM of the host's ISA
> > for RISCV_ISA_EXT_SSCOFPMF to checking the guest's ISA instead. Maybe
> > it's not worth it, though, if the guest PMU isn't useful without overflow.
> > But, sometimes it's nice to be able to disable stuff for debug and
> > workarounds.
> > 
> 
> As per my understanding, kvm_riscv_vcpu_isa_disable_allowed only returns
> true for those extensions which can be disabled architecturally.

I think kvm_riscv_vcpu_isa_disable_allowed can return true for any
extensions that KVM can guarantee won't be exposed in any way to the
guest. Extensions that cannot be disabled architecturally must return
false, since their instructions will still be present in the guest, even
if KVM doesn't want to expose them, but extensions which KVM emulates
can return true because KVM can choose not to emulate them. IIUC, sscofpmf
falls in this latter category.

> 
> VMM can still disable any extension by not adding to the device tree.
> In fact, that's how kvmtool can disable sstc or sscofpmf with
> --disable-<isa-ext command>.
> 
> The warning is bit confused though.
> 
> For example: if you run kvmtool with --disable-sstc
> 
> "Warning: Failed to disable sstc ISA exension"

I think Sstc should allow disabling since it has a corresponding henvcfg
bit which KVM could not set in order to force accesses to the Sstc CSRs
to raise ILL exceptions. So, let's put Sstc aside, since it's not a good
example. An extension like Zihintpause, OTOH, cannot be disabled since
the 'pause' instruction will be present even if KVM does not put
Zihintpause in the guest's ISA string. If a kvmtool user uses
--disable-zihintpause, then I think this warning about failing to disable
the extension is appropriate.

> 
> But sstc is disabled: Here is the cpuinfo output.
> # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x0
> mimpid          : 0x0
> hart isa        : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf

Removing from the ISA string is the best we can do in cases like
Zihintpause, and is likely good enough for well-behaved guests, but the
VMM's warning to the user is good for these cases too, since not all
guests are well-behaved.

Thanks,
drew

