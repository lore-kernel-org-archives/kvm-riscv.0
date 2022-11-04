From: Sean Christopherson <seanjc@google.com>
Date: Fri, 4 Nov 2022 15:40:36 +0000
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
 <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
Message-ID: <Y2UydNBFR3e2DAe7@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 04, 2022, Paolo Bonzini wrote:
> On 11/3/22 19:58, Sean Christopherson wrote:
> > 
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 3e508f239098..ebe617ab0b37 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
> >                          strcpy(c->x86_model_id, "386");
> >          }
> >   #endif
> > +
> > +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
> >   }
> >   static const struct cpu_dev default_cpu = {
> 
> Not needed I think?  default_init does not call init_ia32_feat_ctl.

cpuid_deps is only processed by do_clear_cpu_cap(), so unless there's an explicit
"clear" action, the dependencies will not be updated.  It kinda makes sense since
hardware-based features shouldn't end up with scenarios where a dependent feature
exists but the base feature does not (barring bad KVM setups :-) ).

That said, this seems like a bug waiting to happen, and unless I'm missing something
it's quite straightforward to process all dependencies during setup.  Time to find
out if Boris and co. agree :-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 1a85e1fb0922..c4408d03b180 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -147,6 +147,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 extern void setup_clear_cpu_cap(unsigned int bit);
 extern void clear_cpu_cap(struct cpuinfo_x86 *c, unsigned int bit);
+extern void apply_cpuid_deps(struct cpuinfo_x86 *c);
 
 #define setup_force_cpu_cap(bit) do { \
        set_cpu_cap(&boot_cpu_data, bit);       \
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..28ce31dadd7f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1884,6 +1884,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
                        c->x86_capability[i] |= boot_cpu_data.x86_capability[i];
        }
 
+       apply_cpuid_deps(c);
+
        ppin_init(c);
 
        /* Init Machine Check Exception if available. */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index c881bcafba7d..7e91e97973ca 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -138,3 +138,13 @@ void setup_clear_cpu_cap(unsigned int feature)
 {
        do_clear_cpu_cap(NULL, feature);
 }
+
+void apply_cpuid_deps(struct cpuinfo_x86 *c)
+{
+       const struct cpuid_dep *d;
+
+       for (d = cpuid_deps; d->feature; d++) {
+               if (!cpu_has(c, d->feature))
+                       clear_cpu_cap(c, d->feature);
+       }
+}


