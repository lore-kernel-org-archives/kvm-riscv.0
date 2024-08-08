From: Sean Christopherson <seanjc@google.com>
Date: Thu, 8 Aug 2024 08:31:46 -0700
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <877ccrqc06.fsf@draig.linaro.org>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com> <877ccrqc06.fsf@draig.linaro.org>
Message-ID: <ZrTk4sQS8k1-GBb3@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 08, 2024, Alex Benn?e wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 08, 2024, Alex Benn?e wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> 
> >> > Now that hva_to_pfn() no longer supports being called in atomic context,
> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
> >> > hva_to_pfn().
> >> 
> >> The commentary for hva_to_pfn_fast disagrees.
> >> 
> >>   /*
> >>    * The fast path to get the writable pfn which will be stored in @pfn,
> >>    * true indicates success, otherwise false is returned.  It's also the
> >>    * only part that runs if we can in atomic context.
> >>    */
> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
> >> 
> >> At which point did it loose the ability to run in the atomic context? I
> >> couldn't work it out from the commits.
> >
> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic context
> > would still be functionally ok), rather the previous patch
> >
> >   KVM: Drop @atomic param from gfn=>pfn and hva=>pfn APIs
> >
> > removed support for doing so in order to simplify hva_to_pfn() as a whole.
> 
> It still sticks out given the only caller no longer enforces this. 

Oh, sorry, I should have been more explicit.  I'll fix the comment, I simply
missed it.

