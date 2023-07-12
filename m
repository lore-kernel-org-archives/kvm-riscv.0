From: Will Deacon <will@kernel.org>
Date: Wed, 12 Jul 2023 17:10:54 +0100
Subject: [kvmtool PATCH v3 0/8] RISC-V SBI enable/disable, Zbb, Zicboz,
 and Ssaia support
In-Reply-To: <20230706173804.1237348-1-apatel@ventanamicro.com>
References: <20230706173804.1237348-1-apatel@ventanamicro.com>
Message-ID: <20230712161053.GA2986@willie-the-truck>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 06, 2023 at 11:07:56PM +0530, Anup Patel wrote:
> The latest KVM in Linux-6.4 has support for:
> 1) Enabling/disabling SBI extensions from KVM user-space
> 2) Zbb ISA extension support
> 3) Zicboz ISA extension support
> 4) Ssaia ISA extension support
> 
> This series adds corresponding changes in KVMTOOL to use the above
> mentioned features for Guest/VM.
> 
> These patches can also be found in the riscv_sbi_zbb_zicboz_ssaia_v3
> branch at: https://github.com/avpatel/kvmtool.git
> 
> Changes since v2:
>  - Rebased on commit 0b5e55fc032d1c6394b8ec7fe02d842813c903df
>  - Updated PATCH1 to sync-up header with released Linux-6.4

Bah, now we're back to the __DECLARE_FLEX_ARRAY breakage :(

In file included from include/linux/kvm.h:15,
                 from x86/include/kvm/kvm-cpu-arch.h:6,
                 from include/kvm/kvm-cpu.h:4,
                 from include/kvm/ioport.h:4,
                 from hw/rtc.c:4:
x86/include/asm/kvm.h:511:17: error: expected specifier-qualifier-list before ?__DECLARE_FLEX_ARRAY?
  511 |                 __DECLARE_FLEX_ARRAY(struct kvm_vmx_nested_state_data, vmx);
      |                 ^~~~~~~~~~~~~~~~~~~~


Will

