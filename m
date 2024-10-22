From: Yan Zhao <yan.y.zhao@intel.com>
Date: Tue, 22 Oct 2024 10:15:14 +0800
Subject: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
In-Reply-To: <ZxakJr_jWkU-Y54e@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-52-seanjc@google.com>
 <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
 <ZxakJr_jWkU-Y54e@google.com>
Message-ID: <ZxcKsmvPkKJgsp2l@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 21, 2024 at 11:57:42AM -0700, Sean Christopherson wrote:
> On Mon, Oct 21, 2024, Yan Zhao wrote:
> > On Thu, Oct 10, 2024 at 11:23:53AM -0700, Sean Christopherson wrote:
> > > Use __kvm_faultin_page() get the APIC access page so that KVM can
> > > precisely release the refcounted page, i.e. to remove yet another user
> > > of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> > > page fault, the semantics are effectively the same; KVM just happens to
> > > be mapping the pfn into a VMCS field instead of a secondary MMU.
> > > 
> > > Tested-by: Alex Benn?e <alex.bennee@linaro.org>
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> 
> ...
> 
> > > @@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
> > >  		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
> > >  
> > >  	/*
> > > -	 * Do not pin apic access page in memory, the MMU notifier
> > > -	 * will call us again if it is migrated or swapped out.
> > > +	 * Do not pin the APIC access page in memory so that it can be freely
> > > +	 * migrated, the MMU notifier will call us again if it is migrated or
> > > +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> > > +	 * should always point at a refcounted page (if the pfn is valid).
> > >  	 */
> > > -	kvm_release_pfn_clean(pfn);
> > > +	if (!WARN_ON_ONCE(!refcounted_page))
> > > +		kvm_release_page_clean(refcounted_page);
> > Why it's not
> > if (!WARN_ON_ONCE(!refcounted_page)) {
> > 	if (writable)
> > 		kvm_release_page_dirty(refcounted_page)
> > 	else
> > 		kvm_release_page_clean(refcounted_page)
> > }
> > 
> > or simply not pass "writable" to __kvm_faultin_pfn() as we know the slot is
> > not read-only and then set dirty ?
> 
> __kvm_faultin_pfn() requires a non-NULL @writable.  The intent is to help ensure
Ah, right.

> the caller is actually checking whether a readable vs. writable mapping was
> acquired.  For cases that explicitly pass FOLL_WRITE, it's awkward, but those
> should be few and far between.
Yes, a little weird though nothing wrong in this case by passing "writable"
without checking its value back :)

> 
> > if (!WARN_ON_ONCE(!refcounted_page))
> > 	kvm_release_page_dirty(refcounted_page)
> 
> Ya, this is probably more correct?  Though I would strongly prefer to make any
> change in behavior on top of this series.  The use of kvm_release_page_clean()
> was added by commit 878940b33d76 ("KVM: VMX: Retry APIC-access page reload if
> invalidation is in-progress"), and I suspect the only reason it added the
> kvm_set_page_accessed() call is because there was no "unused" variant.  I.e. there
> was no concious decision to set Accessed but not Dirty.
Thanks for the explanation.
I asked that because I noticed that the policies for setting Accessed or Dirty
for the APIC access page are not aligned between L1 (only Accessed) and L2 (Dirty).

