From: Sean Christopherson <seanjc@google.com>
Date: Thu, 2 Nov 2023 08:56:43 -0700
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Message-ID: <ZUPGu6jroYv3KFPv@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Kai Huang wrote:
> On Wed, 2023-11-01 at 10:36 -0700, Sean Christopherson wrote:
> > On Wed, Nov 01, 2023, Kai Huang wrote:
> > > 
> > > > +7.34 KVM_CAP_MEMORY_FAULT_INFO
> > > > +------------------------------
> > > > +
> > > > +:Architectures: x86
> > > > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > > > +
> > > > +The presence of this capability indicates that KVM_RUN will fill
> > > > +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> > > > +there is a valid memslot but no backing VMA for the corresponding host virtual
> > > > +address.
> > > > +
> > > > +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> > > > +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> > > > +to KVM_EXIT_MEMORY_FAULT.
> > > 
> > > IIUC returning -EFAULT or whatever -errno is sort of KVM internal
> > > implementation.
> > 
> > The errno that is returned to userspace is ABI.  In KVM, it's a _very_ poorly
> > defined ABI for the vast majority of ioctls(), but it's still technically ABI.
> > KVM gets away with being cavalier with errno because the vast majority of errors
> > are considered fatal by userespace, i.e. in most cases, userspace simply doesn't
> > care about the exact errno.
> > 
> > A good example is KVM_RUN with -EINTR; if KVM were to return something other than
> > -EINTR on a pending signal or vcpu->run->immediate_exit, userspace would fall over.
> > 
> > > Is it better to relax the validity of kvm_run.memory_fault when
> > > KVM_RUN returns any -errno?
> > 
> > Not unless there's a need to do so, and if there is then we can update the
> > documentation accordingly.  If KVM's ABI is that kvm_run.memory_fault is valid
> > for any errno, then KVM would need to purge kvm_run.exit_reason super early in
> > KVM_RUN, e.g. to prevent an -EINTR return due to immediate_exit from being
> > misinterpreted as KVM_EXIT_MEMORY_FAULT.  And purging exit_reason super early is
> > subtly tricky because KVM's (again, poorly documented) ABI is that *some* exit
> > reasons are preserved across KVM_RUN with vcpu->run->immediate_exit (or with a
> > pending signal).
> > 
> > https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf at google.com
> > 
> > 
> 
> Agreed with not to relax to any errno.  However using -EFAULT as part of ABI
> definition seems a little bit dangerous, e.g., someone could accidentally or
> mistakenly return -EFAULT in KVM_RUN at early time and/or in a completely
> different code path, etc. ?-EINTR has well defined meaning, but -EFAULT (which
> is "Bad address") seems doesn't but I am not sure either. :-)

KVM has returned -EFAULT since forever, i.e. it's effectively already part of the
ABI.  I doubt there's a userspace that relies precisely on -EFAULT, but userspace
definitely will be confused if KVM returns '0' where KVM used to return -EFAULT.
And so if we want to return '0', it needs to be opt-in, which means forcing
userspace to enable a capability *and* requires code in KVM to conditionally return
'0' instead of -EFAULT/-EHWPOISON.

> One example is, for backing VMA with VM_IO | VM_PFNMAP, hva_to_pfn() returns
> KVM_PFN_ERR_FAULT when the kernel cannot get a valid PFN (e.g. when SGX vepc
> fault handler failed to allocate EPC) and kvm_handle_error_pfn() will just
> return -EFAULT.  If kvm_run.exit_reason isn't purged early then is it possible
> to have some issue here?

Well, yeah, but that's exactly why this series has a patch to reset exit_reason.
The solution to "if KVM is buggy then bad things happen" is to not have KVM bugs :-)

