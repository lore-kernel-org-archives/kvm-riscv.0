From: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Oct 2024 11:13:08 -0700
Subject: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
In-Reply-To: <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-35-seanjc@google.com>
 <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaZtJGfN2_5Db6h@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:36AM -0700, Sean Christopherson wrote:
> > When creating a memory map for read, don't request a writable pfn from the
> > primary MMU.  While creating read-only mappings can be theoretically slower,
> > as they don't play nice with fast GUP due to the need to break CoW before
> > mapping the underlying PFN, practically speaking, creating a mapping isn't
> > a super hot path, and getting a writable mapping for reading is weird and
> > confusing.
> > 
> > Tested-by: Alex Benn?e <alex.bennee@linaro.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 080740f65061..b845e9252633 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
> >  	struct kvm_follow_pfn kfp = {
> >  		.slot = gfn_to_memslot(vcpu->kvm, gfn),
> >  		.gfn = gfn,
> > -		.flags = FOLL_WRITE,
> > +		.flags = writable ? FOLL_WRITE : 0,
> >  		.refcounted_page = &map->pinned_page,
> >  		.pin = true,
> >  	};
> When writable is false, could we set ".pin = false," ?

Hmm, maybe?  I can't imagine anything would actually break, but unless FOLL_PIN
implies writing, my preference would still be to pin the page so that KVM always
pins when accessing the actual data of a page.

> Also not sure if ".map_writable = NULL" is missing.

Doh, my previous response was slightly wrong, it's implicitly initialized to NULL,
not false.  I forgot map_writable is a pointer to a bool.

