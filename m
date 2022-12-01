From: Paul Durrant <xadimgnik@gmail.com>
Date: Thu, 1 Dec 2022 10:43:18 +0000
Subject: [PATCH v2 34/50] KVM: x86: Unify pr_fmt to use module name for
 all KVM modules
In-Reply-To: <20221130230934.1014142-35-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-35-seanjc@google.com>
Message-ID: <aa3be096-4f05-b653-b801-e102abe01903@xen.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30/11/2022 23:09, Sean Christopherson wrote:
> Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that printks
> use consistent formatting across common x86, Intel, and AMD code.  In
> addition to providing consistent print formatting, using KBUILD_MODNAME,
> e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV and
> SGX and ...) as technologies without generating weird messages, and
> without causing naming conflicts with other kernel code, e.g. "SEV: ",
> "tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM subsystems.
> 
> Opportunistically move away from printk() for prints that need to be
> modified anyways, e.g. to drop a manual "kvm: " prefix.
> 
> Opportunistically convert a few SGX WARNs that are similarly modified to
> WARN_ONCE; in the very unlikely event that the WARNs fire, odds are good
> that they would fire repeatedly and spam the kernel log without providing
> unique information in each print.
> 
> Note, defining pr_fmt yields undesirable results for code that uses KVM's
> printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing problem
> as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
> wrappers is relatively limited in KVM x86 code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
[snip]
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index b246decb53a9..3bf7d69373cf 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -5,6 +5,7 @@
>    *
>    * KVM Xen emulation
>    */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include "x86.h"
>   #include "xen.h"

Reviewed-by: Paul Durrant <paul@xen.org>


