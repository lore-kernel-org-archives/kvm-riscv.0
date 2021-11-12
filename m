From: Sean Christopherson <seanjc@google.com>
Date: Fri, 12 Nov 2021 01:32:41 +0000
Subject: [PATCH v5.5 30/30] KVM: Dynamically allocate "new" memslots from
 the get-go
In-Reply-To: <fee75f86-26b0-2dbe-770a-8ecf5cc9e178@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-31-seanjc@google.com>
 <fee75f86-26b0-2dbe-770a-8ecf5cc9e178@oracle.com>
Message-ID: <YY3EOeHVvgOKHNnt@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > Allocate the "new" memslot for !DELETE memslot updates straight away
> > instead of filling an intermediate on-stack object and forcing
> > kvm_set_memslot() to juggle the allocation and do weird things like reuse
> > the old memslot object in MOVE.
> > 
> > In the MOVE case, this results in an "extra" memslot allocation due to
> > allocating both the "new" slot and the "invalid" slot, but that's a
> > temporary and not-huge allocation, and MOVE is a relatively rare memslot
> > operation.
> > 
> > Regarding MOVE, drop the open-coded management of the gfn tree with a
> > call to kvm_replace_memslot(), which already handles the case where
> > new->base_gfn != old->base_gfn.  This is made possible by virtue of not
> > having to copy the "new" memslot data after erasing the old memslot from
> > the gfn tree.  Using kvm_replace_memslot(), and more specifically not
> > reusing the old memslot, means the MOVE case now does hva tree and hash
> > list updates, but that's a small price to pay for simplifying the code
> > and making MOVE align with all the other flavors of updates.  The "extra"
> > updates are firmly in the noise from a performance perspective, e.g. the
> > "move (in)active area" selfttests show a (very, very) slight improvement.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 
> For a new patch set version when the "main" commit is rewritten anyway
> (I mean the one titled "Keep memslots in tree-based structures instead of
> array-based ones") it makes sense to integrate changes like these into
> such modified main commit.
> 
> This way a full algorithm / logic check for all the supported memslot
> operations needs to be done only once instead of having to be done
> multiple times for all these intermediate forms of the code (as this is
> a quite time-consuming job to do properly).
> 
> I think it only makes sense to separate non-functional changes (like
> renaming of variables, comment rewording, open-coding a helper, etc.)
> into their own patches for ease of reviewing.

I agree that validating intermediate stages is time-consuming and can be
frustrating, but that doesn't diminish the value of intermediate patches.  I do
tend to lean too far towards slicing and dicing, but I am quite confident that
I've come out ahead in terms of time spent validating smaller patches versus
time saved because bisection could pinpoint the exact problem.

E.g. in this patch, arch code can now see a NULL @new.  That's _supposed_ to be a
non-functional change, but it would be all too easy to have missed a path in the
prep work where an arch accesses @new without first checking it for NULL (or DELETE).
If such a bug were to escape review, then bisection would point at this patch, not
the mega patch that completely reworked the core memslots behavior.

And IIRC, I actually botched the prior "bitter end" patch and initially missed a
new.npages => npages conversion.  Again, no functional change _intended_, but one
of the main reasons for doing small(er) intermediate patches is precisely so that
any unintended behavior stands out and is easier to debug/triage.

> Or if the main commit was unchanged from the last reviewed version so
> actual changes in the new version will stand out.
> 
> Thanks,
> Maciej

