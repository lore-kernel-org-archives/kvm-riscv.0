From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 14:55:30 -0800
Subject: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
In-Reply-To: <ZdfNwhe2s0Mn2gB4@google.com>
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
 <ZcKYRsNUAngWGy2a@google.com> <ZdfNwhe2s0Mn2gB4@google.com>
Message-ID: <ZdfQ4jI8yT-bvbV4@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 22, 2024, Sean Christopherson wrote:
> On Tue, Feb 06, 2024, Sean Christopherson wrote:
> > On Fri, Feb 02, 2024, Sean Christopherson wrote:
> > > +int main(int argc, char *argv[])
> > > +{
> > > +	TEST_REQUIRE(is_kvm_sev_supported());
> > 
> > This also needs
> > 
> > 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
> > 
> > to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
> > KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
> > via module param, etc.
> 
> Thinking more about this, I think we should simply delete is_kvm_sev_supported().
> (a) it obviously doesn't query _KVM_ support, and (b) if KVM says SEV is supported,
> then it darn well actually be supported.

Ugh, and selftests also need to handle the scenario where SEV is enabled, but all
ASIDs are assigned to SEV-ES.  We could try to create a dummy VM and check for an
-EBUSY return, but that is ugly and could result in missing KVM bugs due to tests
being skipped instead of failing.

That's a future problem though, because I think we'll need new KVM functionality
to surface that information.

