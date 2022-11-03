From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 16:08:09 +0100
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <20221102231911.3107438-34-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
Message-ID: <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 00:19, Sean Christopherson wrote:
> +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> +		return false;

I think the reference to the BIOS should remain in these messages and in 
svm.c (even though these days it's much less common for vendors to 
default to disabled virtualization in the system setup).

The check for X86_FEATURE_MSR_IA32_FEAT_CTL is not needed because 
init_ia32_feat_ctl() will clear X86_FEATURE_VMX if the rdmsr fail (and 
not set X86_FEATURE_MSR_IA32_FEAT_CTL).

Paolo


