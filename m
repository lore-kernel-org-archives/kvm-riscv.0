From: Sean Christopherson <seanjc@google.com>
Date: Thu, 3 Nov 2022 18:58:16 +0000
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
Message-ID: <Y2QPSK1/6esl61wQ@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 19:35, Sean Christopherson wrote:
> > It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
> > CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
> > if the actual CPU type matches one of the aforementioned CPU_SUP_*.
> > 
> > E.g. running a kernel built with
> > 
> >    CONFIG_CPU_SUP_INTEL=y
> >    CONFIG_CPU_SUP_AMD=y
> >    # CONFIG_CPU_SUP_HYGON is not set
> >    # CONFIG_CPU_SUP_CENTAUR is not set
> >    # CONFIG_CPU_SUP_ZHAOXIN is not set
> > 
> > on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
> > X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
> > will get unexpected #UDs when trying to enable VMX.
> 
> Oh, I see.  Perhaps X86_FEATURE_VMX and X86_FEATURE_SGX should be moved to
> one of the software words instead of using cpuid.  Nothing that you should
> care about for this series though.

Or maybe something like this?

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..ebe617ab0b37 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
                        strcpy(c->x86_model_id, "386");
        }
 #endif
+
+       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
 }
 
 static const struct cpu_dev default_cpu = {
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index c881bcafba7d..3a7ae67f5a5e 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -72,6 +72,8 @@ static const struct cpuid_dep cpuid_deps[] = {
        { X86_FEATURE_AVX512_FP16,              X86_FEATURE_AVX512BW  },
        { X86_FEATURE_ENQCMD,                   X86_FEATURE_XSAVES    },
        { X86_FEATURE_PER_THREAD_MBA,           X86_FEATURE_MBA       },
+       { X86_FEATURE_VMX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
+       { X86_FEATURE_SGX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
        { X86_FEATURE_SGX_LC,                   X86_FEATURE_SGX       },
        { X86_FEATURE_SGX1,                     X86_FEATURE_SGX       },
        { X86_FEATURE_SGX2,                     X86_FEATURE_SGX1      },


