From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 10 Dec 2021 14:57:30 +0000
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <2d864e94-1bae-4cc2-7242-676ef102398f@redhat.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
 <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
 <5d0a68cd0d06884a2a58338aace811144990f8f5.camel@infradead.org>
 <2d864e94-1bae-4cc2-7242-676ef102398f@redhat.com>
Message-ID: <3f68564f4e46ca911bf1c06f8538ff7adb4d616f.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-12-10 at 15:53 +0100, Paolo Bonzini wrote:
> On 12/10/21 13:25, David Woodhouse wrote:
> > On Thu, 2021-12-09 at 23:34 +0100, Paolo Bonzini wrote:
> > > Compared to the review it's missing this hunk:
> > > 
> > > @@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
> > > 
> > >          gpc->valid = false;
> > > 
> > > -       old_khva = gpc->khva;
> > > +       old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
> > >          old_dirty = gpc->dirty;
> > 
> > Do you know what? I couldn't bring myself to add that a second time. I
> > managed it once, but it made me sad.
> > 
> > Did it like this instead:
> > 
> > -       old_khva = gpc->khva;
> > +       old_khva = gpc->khva - offset_in_page(gpc->khva);
> 
> Very nice, and it would have deserved a macro in include/linux if there 
> wasn't a decent way to write it.

Indeed. I actually went hunting for such, which is where I found
offset_in_page().


> > I checked that for me at least, GCC is clever enough to just do the
> > mask.
> > 
> >          old_khva = gpc->khva - offset_in_page(gpc->khva);
> >   131:   48 8b 43 78             mov    0x78(%rbx),%rax
> >   135:   48 25 00 f0 ff ff       and    $0xfffffffffffff000,%rax
> > 
> > 
> > I still don't see the previous patches in kvm/next ? is that an
> > automatic push after testing has passed, or is the kernel.org
> > infrastructure just *really* slow?
> 
> No, it's me really wanting to send out the -rc5 pull request before the 
> weekend.  Just wait five more minutes.

Ack. Thanks.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211210/0a80286f/attachment.p7s>
