From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Fri, 21 Jul 2023 23:05:53 +0800
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> @@ -6255,12 +6298,17 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>   	if (r)
>   		goto err_async_pf;
>   
> +	r = kvm_gmem_init();
> +	if (r)
> +		goto err_gmem;
> +
>   	kvm_chardev_ops.owner = module;
>   
>   	kvm_preempt_ops.sched_in = kvm_sched_in;
>   	kvm_preempt_ops.sched_out = kvm_sched_out;
>   
>   	kvm_init_debug();
> +	kvm_gmem_init();

why kvm_gmem_init() needs to be called again? by mistake?

