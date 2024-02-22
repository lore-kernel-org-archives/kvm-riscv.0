From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 14:42:10 -0800
Subject: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
In-Reply-To: <ZcKYRsNUAngWGy2a@google.com>
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
 <ZcKYRsNUAngWGy2a@google.com>
Message-ID: <ZdfNwhe2s0Mn2gB4@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 06, 2024, Sean Christopherson wrote:
> On Fri, Feb 02, 2024, Sean Christopherson wrote:
> > +int main(int argc, char *argv[])
> > +{
> > +	TEST_REQUIRE(is_kvm_sev_supported());
> 
> This also needs
> 
> 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
> 
> to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
> KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
> via module param, etc.

Thinking more about this, I think we should simply delete is_kvm_sev_supported().
(a) it obviously doesn't query _KVM_ support, and (b) if KVM says SEV is supported,
then it darn well actually be supported.

