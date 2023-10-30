From: Sean Christopherson <seanjc@google.com>
Date: Mon, 30 Oct 2023 16:10:48 +0000
Subject: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
In-Reply-To: <ZT9lQ9c7Bik6FIpw@chao-email>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-14-seanjc@google.com>
 <ZT9lQ9c7Bik6FIpw@chao-email>
Message-ID: <ZT_ViJOW1p4TN_fI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 30, 2023, Chao Gao wrote:
> On Fri, Oct 27, 2023 at 11:21:55AM -0700, Sean Christopherson wrote:
> >From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> >In confidential computing usages, whether a page is private or shared is
> >necessary information for KVM to perform operations like page fault
> >handling, page zapping etc. There are other potential use cases for
> >per-page memory attributes, e.g. to make memory read-only (or no-exec,
> >or exec-only, etc.) without having to modify memslots.
> >
> >Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> >userspace to operate on the per-page memory attributes.
> >  - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> >    a guest memory range.
> 
> >  - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> >    memory attributes.
> 
> This ioctl() is already removed. So, the changelog is out-of-date and needs
> an update.

Doh, I lost track of this and the fixup for KVM_CAP_MEMORY_ATTRIBUTES below.

> >+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> >+:Architectures: x86
> >+:Type: vm ioctl
> >+:Parameters: struct kvm_memory_attributes(in)
> 
> 					   ^ add one space here?

Ah, yeah, that does appear to be the standard.
> 
> 
> >+static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> >+					  struct kvm_gfn_range *range)
> >+{
> >+	/*
> >+	 * Unconditionally add the range to the invalidation set, regardless of
> >+	 * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> >+	 * if KVM supports RWX attributes in the future and the attributes are
> >+	 * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> >+	 * adding the range allows KVM to require that MMU invalidations add at
> >+	 * least one range between begin() and end(), e.g. allows KVM to detect
> >+	 * bugs where the add() is missed.  Rexlaing the rule *might* be safe,
> 
> 					    ^^^^^^^^ Relaxing
> 
> >@@ -4640,6 +4850,17 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> > 	case KVM_CAP_BINARY_STATS_FD:
> > 	case KVM_CAP_SYSTEM_EVENT_DATA:
> > 		return 1;
> >+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> >+	case KVM_CAP_MEMORY_ATTRIBUTES:
> >+		u64 attrs = kvm_supported_mem_attributes(kvm);
> >+
> >+		r = -EFAULT;
> >+		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> >+			goto out;
> >+		r = 0;
> >+		break;
> 
> This cannot work, e.g., no @argp in this function and is fixed by a later commit:
> 
> 	fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")

I'll post a fixup patch for all of these, thanks much!

