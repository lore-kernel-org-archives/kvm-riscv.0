From: Huang, Kai <kai.huang@intel.com>
Date: Thu, 2 Nov 2023 18:35:20 +0000
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <ZUPD9NWF4eOXqeiA@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
	 <20231027182217.3615211-10-seanjc@google.com>
	 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
	 <ZUKMsOdg3N9wmEzy@google.com>
	 <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
	 <32cb71700aedcbd1f65276cf44a601760ffc364b.camel@intel.com>
	 <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
	 <ZUPD9NWF4eOXqeiA@google.com>
Message-ID: <55672e5b0ff9855e609654b6565f610dbffa56fd.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2023-11-02 at 08:44 -0700, Sean Christopherson wrote:
> On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> > On 11/2/23 10:35, Huang, Kai wrote:
> > > IIUC KVM can already handle the case of poisoned
> > > page by sending signal to user app:
> > > 
> > > ?	static int kvm_handle_error_pfn(struct kvm_vcpu *vcpu,?			struct
> > > kvm_page_fault *fault)???????????????????????????????????????????????	{
> > > ?		...
> > > 
> > > ????????		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> > > ???????????????		kvm_send_hwpoison_signal(fault->slot, fault->gfn);
> 
> No, this doesn't work, because that signals the host virtual address

Ah, right :-)
