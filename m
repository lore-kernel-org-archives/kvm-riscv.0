From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 2 Dec 2022 12:18:49 +0000
Subject: [PATCH v2 35/50] KVM: VMX: Use current CPU's info to perform
 "disabled by BIOS?" checks
In-Reply-To: <20221130230934.1014142-36-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-36-seanjc@google.com>
Message-ID: <94ced947d0f6a82905afbfe413cf1b6d16fa5fd8.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> Use this_cpu_has() instead of boot_cpu_has() to perform the effective
> "disabled by BIOS?" checks for VMX.  This will allow consolidating code
> between vmx_disabled_by_bios() and vmx_check_processor_compat().
> 
> Checking the boot CPU isn't a strict requirement as any divergence in VMX
> enabling between the boot CPU and other CPUs will result in KVM refusing
> to load thanks to the aforementioned vmx_check_processor_compat().
> 
> Furthermore, using the boot CPU was an unintentional change introduced by
> commit a4d0b2fdbcf7 ("KVM: VMX: Use VMX feature flag to query BIOS
> enabling").  Prior to using the feature flags, KVM checked the raw MSR
> value from the current CPU.
> 
> Reported-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>

> ---
>  arch/x86/kvm/vmx/vmx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index e859d2b7daa4..3f7d9f88b314 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -2492,8 +2492,8 @@ static __init int cpu_has_kvm_support(void)
>  
>  static __init int vmx_disabled_by_bios(void)
>  {
> -	return !boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> -	       !boot_cpu_has(X86_FEATURE_VMX);
> +	return !this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> +	       !this_cpu_has(X86_FEATURE_VMX);
>  }
>  
>  static int kvm_cpu_vmxon(u64 vmxon_pointer)

