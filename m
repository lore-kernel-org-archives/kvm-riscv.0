From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 17:46:34 +0300
Subject: [PATCH v2 17/43] KVM: x86: Directly block (instead of
 "halting") UNINITIALIZED vCPUs
In-Reply-To: <20211009021236.4122790-18-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-18-seanjc@google.com>
Message-ID: <e1f8c3d685c43f519927664c1743bc9503773bb1.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Go directly to kvm_vcpu_block() when handling the case where userspace
> attempts to run an UNINITIALIZED vCPU.  The vCPU is not halted, nor is it
> likely that halt-polling will be successful in this case.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index e6c17bbed25c..cd51f100e906 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10133,7 +10133,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  			r = -EINTR;
>  			goto out;
>  		}
> -		kvm_vcpu_halt(vcpu);
> +		kvm_vcpu_block(vcpu);
>  		if (kvm_apic_accept_events(vcpu) < 0) {
>  			r = 0;
>  			goto out;


Makes sense.
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>


Best regards,
	Maxim levitsky


