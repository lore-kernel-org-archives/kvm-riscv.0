From: Sean Christopherson <seanjc@google.com>
Date: Thu, 1 Dec 2022 16:38:16 +0000
Subject: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check to
 module init
In-Reply-To: <87cz93snqc.fsf@mpe.ellerman.id.au>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-27-seanjc@google.com>
 <87cz93snqc.fsf@mpe.ellerman.id.au>
Message-ID: <Y4jXuh4P9Oibki6W@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 01, 2022, Michael Ellerman wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > Move KVM PPC's compatibility checks to their respective module_init()
> > hooks, there's no need to wait until KVM's common compat check, nor is
> > there a need to perform the check on every CPU (provided by common KVM's
> > hook), as the compatibility checks operate on global data.
> >
> >   arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
> >   arch/powerpc/kvm/book3s.c: return 0
> >   arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
> >   arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
> >                              strcmp(cur_cpu_spec->cpu_name, "e5500")
> >                              strcmp(cur_cpu_spec->cpu_name, "e6500")
> 
> I'm not sure that output is really useful in the change log unless you
> explain more about what it is.

Agreed, I got lazy.  I'll write a proper description.
 
> > diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
> > index 57e0ad6a2ca3..795667f7ebf0 100644
> > --- a/arch/powerpc/kvm/e500mc.c
> > +++ b/arch/powerpc/kvm/e500mc.c
> > @@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
> >  {
> >  	int r;
> >  
> > +	r = kvmppc_e500mc_check_processor_compat();
> > +	if (r)
> > +		return kvmppc_e500mc;
>  
> This doesn't build:
> 
> linux/arch/powerpc/kvm/e500mc.c: In function ?kvmppc_e500mc_init?:
> linux/arch/powerpc/kvm/e500mc.c:391:13: error: implicit declaration of function ?kvmppc_e500mc_check_processor_compat?; did you mean ?kvmppc_core_check_processor_compat?? [-Werror=implicit-function-declaration]
>   391 |         r = kvmppc_e500mc_check_processor_compat();
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |             kvmppc_core_check_processor_compat
> linux/arch/powerpc/kvm/e500mc.c:393:24: error: ?kvmppc_e500mc? undeclared (first use in this function); did you mean ?kvm_ops_e500mc??
>   393 |                 return kvmppc_e500mc;
>       |                        ^~~~~~~~~~~~~
>       |                        kvm_ops_e500mc
> linux/arch/powerpc/kvm/e500mc.c:393:24: note: each undeclared identifier is reported only once for each function it appears in

Huh, CONFIG_PPC_E500MC got unselected in the config I use to compile test this
flavor.  I suspect I botched an oldconfig at some point.
 
Anyways, fixed that and the bugs.

Thanks much!

--
Subject: [PATCH] KVM: PPC: Move processor compatibility check to module init

Move KVM PPC's compatibility checks to their respective module_init()
hooks, there's no need to wait until KVM's common compat check, nor is
there a need to perform the check on every CPU (provided by common KVM's
hook).  The compatibility checks are either a nop (Book3S), or simply
check the CPU name stored in the global CPU spec (e500 and e500mc).

Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h |  1 -
 arch/powerpc/kvm/book3s.c          | 10 ----------
 arch/powerpc/kvm/e500.c            |  4 ++--
 arch/powerpc/kvm/e500mc.c          |  6 +++++-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bfacf12784dd..51a1824b0a16 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -118,7 +118,6 @@ extern int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr,
 extern int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_vcpu_free(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_vcpu_setup(struct kvm_vcpu *vcpu);
-extern int kvmppc_core_check_processor_compat(void);
 extern int kvmppc_core_vcpu_translate(struct kvm_vcpu *vcpu,
                                       struct kvm_translation *tr);
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 6d525285dbe8..87283a0e33d8 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -999,16 +999,6 @@ int kvmppc_h_logical_ci_store(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_logical_ci_store);
 
-int kvmppc_core_check_processor_compat(void)
-{
-	/*
-	 * We always return 0 for book3s. We check
-	 * for compatibility while loading the HV
-	 * or PR module
-	 */
-	return 0;
-}
-
 int kvmppc_book3s_hcall_implemented(struct kvm *kvm, unsigned long hcall)
 {
 	return kvm->arch.kvm_ops->hcall_implemented(hcall);
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index c8b2b4478545..0ea61190ec04 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -314,7 +314,7 @@ static void kvmppc_core_vcpu_put_e500(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+static int kvmppc_e500_check_processor_compat(void)
 {
 	int r;
 
@@ -507,7 +507,7 @@ static int __init kvmppc_e500_init(void)
 	unsigned long handler_len;
 	unsigned long max_ivor = 0;
 
-	r = kvmppc_core_check_processor_compat();
+	r = kvmppc_e500_check_processor_compat();
 	if (r)
 		goto err_out;
 
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 57e0ad6a2ca3..4564aa27edcf 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
 
@@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
 {
 	int r;
 
+	r = kvmppc_e500mc_check_processor_compat();
+	if (r)
+		goto err_out;
+
 	r = kvmppc_booke_init();
 	if (r)
 		goto err_out;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 5faf69421f13..d44b85ba8cef 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -442,7 +442,7 @@ int kvm_arch_hardware_enable(void)
 
 int kvm_arch_check_processor_compat(void *opaque)
 {
-	return kvmppc_core_check_processor_compat();
+	return 0;
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)

base-commit: 00e4493db7c6163d48d5b45034d1a77e16a1c8dc
-- 


