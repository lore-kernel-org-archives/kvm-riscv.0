From: Peter Xu <peterx@redhat.com>
Date: Wed, 30 Mar 2022 14:30:24 -0400
Subject: [PATCH v2 16/26] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <CALzav=fZQYC7YyTbZqbkYTYVUXCq4skc6pkQ2S59BoSxbkKUhw@mail.gmail.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-17-dmatlack@google.com>
 <YjGgjTnP/9sG8L+2@xz-m1.local>
 <CALzav=fZQYC7YyTbZqbkYTYVUXCq4skc6pkQ2S59BoSxbkKUhw@mail.gmail.com>
Message-ID: <YkShwFaRqlQpyL87@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 22, 2022 at 03:51:54PM -0700, David Matlack wrote:
> On Wed, Mar 16, 2022 at 1:32 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Mar 11, 2022 at 12:25:18AM +0000, David Matlack wrote:
> > > In order to split a huge page we need to know what access bits to assign
> > > to the role of the new child page table. This can't be easily derived
> > > from the huge page SPTE itself since KVM applies its own access policies
> > > on top, such as for HugePage NX.
> > >
> > > We could walk the guest page tables to determine the correct access
> > > bits, but that is difficult to plumb outside of a vCPU fault context.
> > > Instead, we can store the original access bits for each leaf SPTE
> > > alongside the GFN in the gfns array. The access bits only take up 3
> > > bits, which leaves 61 bits left over for gfns, which is more than
> > > enough. So this change does not require any additional memory.
> >
> > I have a pure question on why eager page split needs to worry on hugepage
> > nx..
> >
> > IIUC that was about forbidden huge page being mapped as executable.  So
> > afaiu the only missing bit that could happen if we copy over the huge page
> > ptes is the executable bit.
> >
> > But then?  I think we could get a page fault on fault->exec==true on the
> > split small page (because when we copy over it's cleared, even though the
> > page can actually be executable), but it should be well resolved right
> > after that small page fault.
> >
> > The thing is IIUC this is a very rare case, IOW, it should mostly not
> > happen in 99% of the use case?  And there's a slight penalty when it
> > happens, but only perf-wise.
> >
> > As I'm not really fluent with the code base, perhaps I missed something?
> 
> You're right that we could get away with not knowing the shadowed
> access permissions to assign to the child SPTEs when splitting a huge
> SPTE. We could just copy the huge SPTE access permissions and then let
> the execute bit be repaired on fault (although those faults would be a
> performance cost).
> 
> But the access permissions are also needed to lookup an existing
> shadow page (or create a new shadow page) to use to split the huge
> page. For example, let's say we are going to split a huge page that
> does not have execute permissions enabled. That could be because NX
> HugePages are enabled or because we are shadowing a guest translation
> that does not allow execution (or both). We wouldn't want to propagate
> the no-execute permission into the child SP role.access if the
> shadowed translation really does allow execution (and vice versa).

Then the follow up (pure) question is what will happen if we simply
propagate the no-exec permission into the child SP?

I think that only happens with direct sptes where guest used huge pages
because that's where the shadow page will be huge, so IIUC that's checked
here when the small page fault triggers:

static void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
				   unsigned direct_access)
{
	if (is_shadow_present_pte(*sptep) && !is_large_pte(*sptep)) {
		struct kvm_mmu_page *child;

		/*
		 * For the direct sp, if the guest pte's dirty bit
		 * changed form clean to dirty, it will corrupt the
		 * sp's access: allow writable in the read-only sp,
		 * so we should update the spte at this point to get
		 * a new sp with the correct access.
		 */
		child = to_shadow_page(*sptep & PT64_BASE_ADDR_MASK);
		if (child->role.access == direct_access)
			return;

		drop_parent_pte(child, sptep);
		kvm_flush_remote_tlbs_with_address(vcpu->kvm, child->gfn, 1);
	}
}

Due to missing EXEC the role.access check will not match with direct
access, which is the guest pgtable value which has EXEC set.  Then IIUC
we'll simply drop the no-exec SP and replace it with a new one with exec
perm.  The question is, would that untimately work too?

Even if that works, I agree this sounds tricky because we're potentially
caching fake sp.role conditionally and it seems we never do that before.
It's just that the other option that you proposed here seems to add other
way of complexity on caching spte permission information while kvm doesn't
do either before.  IMHO we need to see which is the best trade off.

I could have missed something else, though.

Thanks,

-- 
Peter Xu


