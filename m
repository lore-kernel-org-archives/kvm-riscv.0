From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Thu, 1 Dec 2022 23:00:13 +0100
Subject: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
In-Reply-To: <20221130230934.1014142-22-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-22-seanjc@google.com>
Message-ID: <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/12/22 00:09, Sean Christopherson wrote:
> Now that KVM no longer supports trap-and-emulate (see commit 45c7e8af4a5e
> "MIPS: Remove KVM_TE support"), hardcode the MIPS callbacks to the
> virtualization callbacks.
> 
> Harcoding the callbacks eliminates the technically-unnecessary check on
> non-NULL kvm_mips_callbacks in kvm_arch_init().  MIPS has never supported
> multiple in-tree modules, i.e. barring an out-of-tree module, where
> copying and renaming kvm.ko counts as "out-of-tree", KVM could never
> encounter a non-NULL set of callbacks during module init.
> 
> The callback check is also subtly broken, as it is not thread safe,
> i.e. if there were multiple modules, loading both concurrently would
> create a race between checking and setting kvm_mips_callbacks.
> 
> Given that out-of-tree shenanigans are not the kernel's responsibility,
> hardcode the callbacks to simplify the code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/mips/include/asm/kvm_host.h |  2 +-
>   arch/mips/kvm/Makefile           |  2 +-
>   arch/mips/kvm/callback.c         | 14 --------------
>   arch/mips/kvm/mips.c             |  9 ++-------
>   arch/mips/kvm/vz.c               |  7 ++++---
>   5 files changed, 8 insertions(+), 26 deletions(-)
>   delete mode 100644 arch/mips/kvm/callback.c
> 
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 28f0ba97db71..2803c9c21ef9 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -758,7 +758,7 @@ struct kvm_mips_callbacks {
>   	void (*vcpu_reenter)(struct kvm_vcpu *vcpu);
>   };
>   extern struct kvm_mips_callbacks *kvm_mips_callbacks;

IIUC we could even constify this pointer.

Anyway,
Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>

> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index af29490d9740..f0a6c245d1ff 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1012,17 +1012,12 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   
>   int kvm_arch_init(void *opaque)
>   {
> -	if (kvm_mips_callbacks) {
> -		kvm_err("kvm: module already exists\n");
> -		return -EEXIST;
> -	}
> -
> -	return kvm_mips_emulation_init(&kvm_mips_callbacks);
> +	return kvm_mips_emulation_init();
>   }
>   
>   void kvm_arch_exit(void)
>   {
> -	kvm_mips_callbacks = NULL;
> +
>   }
>   
>   int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
> index c706f5890a05..dafab003ea0d 100644
> --- a/arch/mips/kvm/vz.c
> +++ b/arch/mips/kvm/vz.c
> @@ -3304,7 +3304,10 @@ static struct kvm_mips_callbacks kvm_vz_callbacks = {
>   	.vcpu_reenter = kvm_vz_vcpu_reenter,
>   };
>   
> -int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks)
> +/* FIXME: Get rid of the callbacks now that trap-and-emulate is gone. */
> +struct kvm_mips_callbacks *kvm_mips_callbacks = &kvm_vz_callbacks;

