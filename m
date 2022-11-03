From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 19:46:22 +0100
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <Y2QJ2TuyZImbFFvi@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
Message-ID: <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 19:35, Sean Christopherson wrote:
> It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
> CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
> if the actual CPU type matches one of the aforementioned CPU_SUP_*.
> 
> E.g. running a kernel built with
> 
>    CONFIG_CPU_SUP_INTEL=y
>    CONFIG_CPU_SUP_AMD=y
>    # CONFIG_CPU_SUP_HYGON is not set
>    # CONFIG_CPU_SUP_CENTAUR is not set
>    # CONFIG_CPU_SUP_ZHAOXIN is not set
> 
> on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
> X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
> will get unexpected #UDs when trying to enable VMX.

Oh, I see.  Perhaps X86_FEATURE_VMX and X86_FEATURE_SGX should be moved 
to one of the software words instead of using cpuid.  Nothing that you 
should care about for this series though.

Paolo


