From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 8 Aug 2023 09:46:30 -0700
Subject: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <fc430350dd7d8ac664054a99f1e452c1@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
 <ZNJaPxTtPRCv0HOl@google.com> <CAJHc60yiGnVc=ysdOaNemWaDpTBSk02mRLenK3sN2XtN_Cp98g@mail.gmail.com>
 <fc430350dd7d8ac664054a99f1e452c1@kernel.org>
Message-ID: <CAJHc60zspGChscVTj5K31=gzRmFu5d++FZNLz8eaZMxfOV+KAQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 8, 2023 at 9:43?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2023-08-08 17:19, Raghavendra Rao Ananta wrote:
> > On Tue, Aug 8, 2023 at 8:07?AM Sean Christopherson <seanjc@google.com>
> > wrote:
> >>
> >> On Fri, Aug 04, 2023, Raghavendra Rao Ananta wrote:
> >> > On Wed, Aug 2, 2023 at 4:28?PM Raghavendra Rao Ananta
> >> > <rananta@google.com> wrote:
> >> > >
> >> > > Sure, I'll change it to kvm_arch_flush_vm_tlbs() in v8.
> >> > >
> >> > While working on the renaming, I realized that since this function is
> >> > called from kvm_main.c's kvm_flush_remote_tlbs(). Do we want to rename
> >> > this and the other kvm_flush_*() functions that the series introduces
> >> > to match their kvm_arch_flush_*() counterparts?
> >>
> >> Hmm, if we're going to rename one arch hook, then yes, I think it
> >> makes sense to
> >> rename all the common APIs and arch hooks to match.
> >>
> >> However, x86 is rife with the "remote_tlbs" nomenclature, and renaming
> >> the common
> >> APIs will just push the inconsistencies into x86.  While I 100% agree
> >> that the
> >> current naming is flawed, I am not willing to end up with x86 being
> >> partially
> >> converted.
> >>
> >> I think I'm ok renaming all of x86's many hooks?  But I'd definitely
> >> want input
> >> from more x86 folks, and the size and scope of this series would
> >> explode.  Unless
> >> Marc objects and/or has a better idea, the least awful option is
> >> probably to ignore
> >> the poor "remote_tlbs" naming and tackle it in a separate series.
> >>
> > Sure, I think it's better to do it in a separate series as well. I'm
> > happy to carry out the task after this one gets merged. But, let's
> > wait for Marc and others' opinion on the matter.
>
> Yeah, let's punt that to a separate series. I'm more interested in
> getting this code merged than in the inevitable bike-shedding that
> will result from such a proposal.
>
> Raghavendra, any chance you could respin the series this week?
> I'd really like it to spend some quality time in -next...
>
No problem. I'll send out v8 by today or tomorrow.

Thank you.
Raghavendra
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...

