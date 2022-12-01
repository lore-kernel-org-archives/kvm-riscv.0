From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 01 Dec 2022 16:21:31 +1100
Subject: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check
 to module init
In-Reply-To: <20221130230934.1014142-27-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
Message-ID: <87cz93snqc.fsf@mpe.ellerman.id.au>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:
> Move KVM PPC's compatibility checks to their respective module_init()
> hooks, there's no need to wait until KVM's common compat check, nor is
> there a need to perform the check on every CPU (provided by common KVM's
> hook), as the compatibility checks operate on global data.
>
>   arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
>   arch/powerpc/kvm/book3s.c: return 0
>   arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
>   arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
>                              strcmp(cur_cpu_spec->cpu_name, "e5500")
>                              strcmp(cur_cpu_spec->cpu_name, "e6500")

I'm not sure that output is really useful in the change log unless you
explain more about what it is.

> diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> index 57e0ad6a2ca3..795667f7ebf0 100644
> --- a/arch/powerpc/kvm/e500mc.c
> +++ b/arch/powerpc/kvm/e500mc.c
> @@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
>  {
>  	int r;
>  
> +	r = kvmppc_e500mc_check_processor_compat();
> +	if (r)
> +		return kvmppc_e500mc;
 
This doesn't build:

linux/arch/powerpc/kvm/e500mc.c: In function ?kvmppc_e500mc_init?:
linux/arch/powerpc/kvm/e500mc.c:391:13: error: implicit declaration of function ?kvmppc_e500mc_check_processor_compat?; did you mean ?kvmppc_core_check_processor_compat?? [-Werror=implicit-function-declaration]
  391 |         r = kvmppc_e500mc_check_processor_compat();
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |             kvmppc_core_check_processor_compat
linux/arch/powerpc/kvm/e500mc.c:393:24: error: ?kvmppc_e500mc? undeclared (first use in this function); did you mean ?kvm_ops_e500mc??
  393 |                 return kvmppc_e500mc;
      |                        ^~~~~~~~~~~~~
      |                        kvm_ops_e500mc
linux/arch/powerpc/kvm/e500mc.c:393:24: note: each undeclared identifier is reported only once for each function it appears in


It needs the delta below to compile.

With that:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 795667f7ebf0..4564aa27edcf 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
 
@@ -390,7 +390,7 @@ static int __init kvmppc_e500mc_init(void)
 
 	r = kvmppc_e500mc_check_processor_compat();
 	if (r)
-		return kvmppc_e500mc;
+		goto err_out;
 
 	r = kvmppc_booke_init();
 	if (r)

