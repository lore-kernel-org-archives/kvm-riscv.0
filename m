From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 17 Apr 2024 11:40:40 +1000
Subject: [RFC kvm-unit-tests PATCH v2 00/14] add shellcheck support
In-Reply-To: <3ed01604-3b9e-4131-9ec0-c354c6d65cc8@redhat.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
 <a7cdd98e-93c1-4546-bba4-ac3a465f01f5@redhat.com>
 <D0L86IDPMTI3.2XFZ8C6UCVD1B@gmail.com>
 <3ed01604-3b9e-4131-9ec0-c354c6d65cc8@redhat.com>
Message-ID: <D0M0K25RUX0G.1FCOQS1GR21N4@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue Apr 16, 2024 at 2:46 PM AEST, Thomas Huth wrote:
> On 16/04/2024 05.26, Nicholas Piggin wrote:
> > On Mon Apr 15, 2024 at 9:59 PM AEST, Thomas Huth wrote:
> >> On 06/04/2024 14.38, Nicholas Piggin wrote:
> >>> Tree here
> >>>
> >>> https://gitlab.com/npiggin/kvm-unit-tests/-/tree/shellcheck
> >>>
> >>> Again on top of the "v8 migration, powerpc improvements" series. I
> >>> don't plan to rebase the other way around since it's a lot of work.
> >>> So this is still in RFC until the other big series gets merged.
> >>>
> >>> Thanks to Andrew for a lot of review. A submitted the likely s390x
> >>> bugs separately ahead of this series, and also disabled one of the
> >>> tests and dropped its fix patch as-per review comments. Hence 3 fewer
> >>> patches. Other than that, since last post:
> >>>
> >>> * Tidied commit messages and added some of Andrew's comments.
> >>> * Removed the "SC2034 unused variable" blanket disable, and just
> >>>     suppressed the config.mak and a couple of other warnings.
> >>> * Blanket disabled "SC2235 Use { ..; } instead of (..)" and dropped
> >>>     the fix for it.
> >>> * Change warning suppression comments as per Andrew's review, also
> >>>     mention in the new unittests doc about the "check =" option not
> >>>     allowing whitespace etc in the name since we don't cope with that.
> >>>
> >>> Thanks,
> >>> Nick
> >>>
> >>> Nicholas Piggin (14):
> >>>     Add initial shellcheck checking
> >>>     shellcheck: Fix SC2223
> >>>     shellcheck: Fix SC2295
> >>>     shellcheck: Fix SC2094
> >>>     shellcheck: Fix SC2006
> >>>     shellcheck: Fix SC2155
> >>>     shellcheck: Fix SC2143
> >>>     shellcheck: Fix SC2013
> >>>     shellcheck: Fix SC2145
> >>>     shellcheck: Fix SC2124
> >>>     shellcheck: Fix SC2294
> >>>     shellcheck: Fix SC2178
> >>>     shellcheck: Fix SC2048
> >>>     shellcheck: Suppress various messages
> >>
> >> I went ahead and pushed a bunch of your patches to the k-u-t master branch
> >> now. However, there were also some patches which did not apply cleanly to
> >> master anymore, so please rebase the remaining patches and then send them again.
> > 
> > Hey Thomas,
> > 
> > Yeah the sc patches were based on top of the big series, so some
> > collisions expected. I'll look at rebasing.
>
> Ah, ok, we can also try to get in the big series first ... I just lack 

They should have come first, but I'd written the multi migration code
before Andrew suggested adding sc, and it looked like hard work to
rebase the other way. I'll try again.

> enough spare time for reviewing currently, so it might take a while :-/

Understandable. You've done heaps of reviewing already so I really
appreciate it.

Thanks,
Nick

