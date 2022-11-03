From: Sean Christopherson <seanjc@google.com>
Date: Thu, 3 Nov 2022 17:53:31 +0000
Subject: [PATCH 39/44] KVM: Drop kvm_count_lock and instead protect
 kvm_usage_count with kvm_lock
In-Reply-To: <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-40-seanjc@google.com>
 <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
Message-ID: <Y2QAG0wCPNv7atC/@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > +- kvm_lock is taken outside kvm->mmu_lock
> 
> Not surprising since one is a mutex and one is an rwlock. :)

Heh, 

  Signed-off-by: Captain Obvious <seanjc@google.com>

> You can drop this hunk as well as the "Opportunistically update KVM's locking
> documentation" sentence in the commit message.

Will do.

> >   - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock
> >   - kvm->arch.mmu_lock is an rwlock.  kvm->arch.tdp_mmu_pages_lock and
> > @@ -216,15 +220,11 @@ time it will be set using the Dirty tracking mechanism described above.
> >   :Type:		mutex
> >   :Arch:		any
> >   :Protects:	- vm_list
> > -
> > -``kvm_count_lock``
> > -^^^^^^^^^^^^^^^^^^
> > -
> > -:Type:		raw_spinlock_t
> > -:Arch:		any
> > -:Protects:	- hardware virtualization enable/disable
> > -:Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
> > -		migration.
> > +		- kvm_usage_count
> > +		- hardware virtualization enable/disable
> > +		- module probing (x86 only)
> 
> What do you mean exactly by "module probing"?  Is it anything else than what
> is serialized by vendor_module_lock?

Ooh, I forgot to update this patch after switching to vendor_module_lock.  I
added the above after fixing the first deadlock between kvm_lock and cpu_hotplug_lock,
but later gave up on trying to use kvm_lock after deadlock #2, which is when I
when I realized piggybacking kvm_lock was going to be a maintainance nightmare due.

