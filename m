From: Fuad Tabba <tabba@google.com>
Date: Mon, 31 Jul 2023 17:23:33 +0100
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZL/yb4wL4Nhf9snZ@google.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
 <ZL/yb4wL4Nhf9snZ@google.com>
Message-ID: <CA+EHjTwGoMgoTEktL9zq2190TMY=vU29xv+oQ7X2Eeu8c8AmjQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sean,

On Tue, Jul 25, 2023 at 5:04?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Jul 25, 2023, Wei W Wang wrote:
> > On Wednesday, July 19, 2023 7:45 AM, Sean Christopherson wrote:
> > > +int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > > +                gfn_t gfn, kvm_pfn_t *pfn, int *max_order) {
> > > +   pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
> > > +   struct kvm_gmem *gmem;
> > > +   struct folio *folio;
> > > +   struct page *page;
> > > +   struct file *file;
> > > +
> > > +   file = kvm_gmem_get_file(slot);
> > > +   if (!file)
> > > +           return -EFAULT;
> > > +
> > > +   gmem = file->private_data;
> > > +
> > > +   if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
> > > +           fput(file);
> > > +           return -EIO;
> > > +   }
> > > +
> > > +   folio = kvm_gmem_get_folio(file_inode(file), index);
> > > +   if (!folio) {
> > > +           fput(file);
> > > +           return -ENOMEM;
> > > +   }
> > > +
> > > +   page = folio_file_page(folio, index);
> > > +
> > > +   *pfn = page_to_pfn(page);
> > > +   *max_order = compound_order(compound_head(page));
> >
> > Maybe better to check if caller provided a buffer to get the max_order:
> > if (max_order)
> >       *max_order = compound_order(compound_head(page));
> >
> > This is what the previous version did (restrictedmem_get_page),
> > so that callers who only want to get a pfn don't need to define
> > an unused "order" param.
>
> My preference would be to require @max_order.  I can kinda sorta see why a generic
> implementation (restrictedmem) would make the param optional, but with gmem being
> KVM-internal I think it makes sense to require the param.  Even if pKVM doesn't
> _currently_ need/want the order of the backing allocation, presumably that's because
> hugepage support is still on the TODO list, not because pKVM fundamentally doesn't
> need to know the order of the backing allocation.

You're right that with huge pages pKVM will eventually need to know
the order of the backing allocation, but there is at least one use
case where it doesn't, which I ran into in the previous ports as well
as this one. In pKVM (and in possibly other implementations), the host
needs to access (shared) guest memory that isn't mapped. For that,
I've used kvm_*_get_pfn(), only requiring the pfn, so get the page via
pfn_to_page().

Although it's not that big, my preference would be for max_order to be optional.

Thanks!
/fuad

