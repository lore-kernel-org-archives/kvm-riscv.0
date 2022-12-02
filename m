From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 2 Dec 2022 13:36:05 +0000
Subject: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
In-Reply-To: <20221130230934.1014142-41-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-41-seanjc@google.com>
Message-ID: <cf755389c21c73e8367d8162cabc83629d3f9a74.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11967,6 +11967,11 @@ int kvm_arch_hardware_enable(void)
> ?	bool stable, backwards_tsc = false;
> ?
> ?	kvm_user_return_msr_cpu_online();
> +
> +	ret = kvm_x86_check_processor_compatibility();
> +	if (ret)
> +		return ret;
> +
> ?	ret = static_call(kvm_x86_hardware_enable)();
> ?	if (ret != 0)
> ?		return ret;

Thinking more, AFAICT, kvm_x86_vendor_init() so far still does the compatibility
check on all online cpus.  Since now kvm_arch_hardware_enable() also does the
compatibility check, IIUC the compatibility check will be done twice -- one in
kvm_x86_vendor_init() and one in hardware_enable_all() when creating the first
VM.

Do you think it's still worth to do compatibility check in vm_x86_vendor_init()?

The behaviour difference should be "KVM module fail to load" vs "failing to
create the first VM" IIUC.  I don't know whether the former is better than the
better, but it seems duplicated compatibility checking isn't needed?


