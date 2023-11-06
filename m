From: Sean Christopherson <seanjc@google.com>
Date: Mon, 6 Nov 2023 08:13:01 -0800
Subject: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
In-Reply-To: <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
 <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Message-ID: <ZUkQjW-yMnLfD7XW@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 06, 2023, Fuad Tabba wrote:
> On Sun, Nov 5, 2023 at 4:34?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> > +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t size,
> > +                           bool punch_hole)
> > +{
> > +       const int mode = FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_PUNCH_HOLE : 0);
> > +       struct userspace_mem_region *region;
> > +       uint64_t end = base + size;
> > +       uint64_t gpa, len;
> > +       off_t fd_offset;
> > +       int ret;
> > +
> > +       for (gpa = base; gpa < end; gpa += len) {
> > +               uint64_t offset;
> > +
> > +               region = userspace_mem_region_find(vm, gpa, gpa);
> > +               TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
> > +                           "Private memory region not found for GPA 0x%lx", gpa);
> > +
> > +               offset = (gpa - region->region.guest_phys_addr);
> 
> nit: why the parentheses?

I simply forgot to remove them when I changed the function to support spanning
multiple memslots, i.e. when the code went from this

	fd_offset = region->region.gmem_offset +
		    (gpa - region->region.guest_phys_addr);

to what you see above.

