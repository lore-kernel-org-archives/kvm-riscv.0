From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 4 Nov 2022 09:02:32 +0100
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <Y2QPSK1/6esl61wQ@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
Message-ID: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 19:58, Sean Christopherson wrote:
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 3e508f239098..ebe617ab0b37 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
>                          strcpy(c->x86_model_id, "386");
>          }
>   #endif
> +
> +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
>   }
>   
>   static const struct cpu_dev default_cpu = {

Not needed I think?  default_init does not call init_ia32_feat_ctl.

> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
> index c881bcafba7d..3a7ae67f5a5e 100644
> --- a/arch/x86/kernel/cpu/cpuid-deps.c
> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
> @@ -72,6 +72,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>          { X86_FEATURE_AVX512_FP16,              X86_FEATURE_AVX512BW  },
>          { X86_FEATURE_ENQCMD,                   X86_FEATURE_XSAVES    },
>          { X86_FEATURE_PER_THREAD_MBA,           X86_FEATURE_MBA       },
> +       { X86_FEATURE_VMX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
> +       { X86_FEATURE_SGX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
>          { X86_FEATURE_SGX_LC,                   X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX1,                     X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX2,                     X86_FEATURE_SGX1      },
> 

Yes, good idea.

Paolo


