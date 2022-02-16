From: Claudio Imbrenda <imbrenda@linux.ibm.com>
Date: Wed, 16 Feb 2022 17:21:17 +0100
Subject: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
Message-ID: <20220216172117.194e5309@p-imbrenda>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 16 Feb 2022 11:15:17 +0800
Chao Gao <chao.gao@intel.com> wrote:

> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>

for KVM s390:

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       |  2 +-
>  arch/mips/kvm/mips.c       |  2 +-
>  arch/powerpc/kvm/powerpc.c |  2 +-
>  arch/riscv/kvm/main.c      |  2 +-
>  arch/s390/kvm/kvm-s390.c   |  2 +-
>  arch/x86/kvm/x86.c         |  2 +-
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/kvm_main.c        | 16 +++-------------
>  8 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..092d09fb6a7e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..30c817f3fa0c 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return kvmppc_core_check_processor_compat();
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 2e5ca43c8c49..992877e78393 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
>  	return -EINVAL;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 577f1ead6a51..0053b81c6b02 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9b484ed61f37..ffb88f0b7265 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11509,7 +11509,7 @@ void kvm_arch_hardware_unsetup(void)
>  	static_call(kvm_x86_hardware_unsetup)();
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..2ad78e729bf7 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1413,7 +1413,7 @@ int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
>  int kvm_arch_hardware_setup(void *opaque);
>  void kvm_arch_hardware_unsetup(void);
> -int kvm_arch_check_processor_compat(void *opaque);
> +int kvm_arch_check_processor_compat(void);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 83c57bcc6eb6..ee47d33d69e1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5643,22 +5643,14 @@ void kvm_unregister_perf_callbacks(void)
>  }
>  #endif
>  
> -struct kvm_cpu_compat_check {
> -	void *opaque;
> -	int *ret;
> -};
> -
> -static void check_processor_compat(void *data)
> +static void check_processor_compat(void *rtn)
>  {
> -	struct kvm_cpu_compat_check *c = data;
> -
> -	*c->ret = kvm_arch_check_processor_compat(c->opaque);
> +	*(int *)rtn = kvm_arch_check_processor_compat();
>  }
>  
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  		  struct module *module)
>  {
> -	struct kvm_cpu_compat_check c;
>  	int r;
>  	int cpu;
>  
> @@ -5686,10 +5678,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	if (r < 0)
>  		goto out_free_1;
>  
> -	c.ret = &r;
> -	c.opaque = opaque;
>  	for_each_online_cpu(cpu) {
> -		smp_call_function_single(cpu, check_processor_compat, &c, 1);
> +		smp_call_function_single(cpu, check_processor_compat, &r, 1);
>  		if (r < 0)
>  			goto out_free_2;
>  	}


