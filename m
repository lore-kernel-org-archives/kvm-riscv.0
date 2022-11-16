From: Sean Christopherson <seanjc@google.com>
Date: Wed, 16 Nov 2022 01:56:12 +0000
Subject: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
In-Reply-To: <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
Message-ID: <Y3RDPOerOIf6SwI0@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 15, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:19 +0000, Sean Christopherson wrote:
> > +static bool __init kvm_is_vmx_supported(void)
> > +{
> > +	if (!cpu_has_vmx()) {
> > +		pr_err("CPU doesn't support VMX\n");
> > +		return false;
> > +	}
> > +
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	??? !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > ?static int __init vmx_check_processor_compat(void)
> > ?{
> > ?	struct vmcs_config vmcs_conf;
> > ?	struct vmx_capability vmx_cap;
> > ?
> > -	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > -	??? !this_cpu_has(X86_FEATURE_VMX)) {
> > -		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
> > +	if (!kvm_is_vmx_supported())
> > ?		return -EIO;
> > -	}
> > ?
> 
> Looks there's a functional change here -- the old code checks local cpu's
> feature bits but the new code always checks bsp's feature bits.  Should have no
> problem I think, though.

Ouch.  The bad check will defeat the purpose of doing compat checks.  Nice catch!

