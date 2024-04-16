From: Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 16 Apr 2024 13:26:28 +1000
Subject: [RFC kvm-unit-tests PATCH v2 00/14] add shellcheck support
In-Reply-To: <a7cdd98e-93c1-4546-bba4-ac3a465f01f5@redhat.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
 <a7cdd98e-93c1-4546-bba4-ac3a465f01f5@redhat.com>
Message-ID: <D0L86IDPMTI3.2XFZ8C6UCVD1B@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon Apr 15, 2024 at 9:59 PM AEST, Thomas Huth wrote:
> On 06/04/2024 14.38, Nicholas Piggin wrote:
> > Tree here
> > 
> > https://gitlab.com/npiggin/kvm-unit-tests/-/tree/shellcheck
> > 
> > Again on top of the "v8 migration, powerpc improvements" series. I
> > don't plan to rebase the other way around since it's a lot of work.
> > So this is still in RFC until the other big series gets merged.
> > 
> > Thanks to Andrew for a lot of review. A submitted the likely s390x
> > bugs separately ahead of this series, and also disabled one of the
> > tests and dropped its fix patch as-per review comments. Hence 3 fewer
> > patches. Other than that, since last post:
> > 
> > * Tidied commit messages and added some of Andrew's comments.
> > * Removed the "SC2034 unused variable" blanket disable, and just
> >    suppressed the config.mak and a couple of other warnings.
> > * Blanket disabled "SC2235 Use { ..; } instead of (..)" and dropped
> >    the fix for it.
> > * Change warning suppression comments as per Andrew's review, also
> >    mention in the new unittests doc about the "check =" option not
> >    allowing whitespace etc in the name since we don't cope with that.
> > 
> > Thanks,
> > Nick
> > 
> > Nicholas Piggin (14):
> >    Add initial shellcheck checking
> >    shellcheck: Fix SC2223
> >    shellcheck: Fix SC2295
> >    shellcheck: Fix SC2094
> >    shellcheck: Fix SC2006
> >    shellcheck: Fix SC2155
> >    shellcheck: Fix SC2143
> >    shellcheck: Fix SC2013
> >    shellcheck: Fix SC2145
> >    shellcheck: Fix SC2124
> >    shellcheck: Fix SC2294
> >    shellcheck: Fix SC2178
> >    shellcheck: Fix SC2048
> >    shellcheck: Suppress various messages
>
> I went ahead and pushed a bunch of your patches to the k-u-t master branch 
> now. However, there were also some patches which did not apply cleanly to 
> master anymore, so please rebase the remaining patches and then send them again.

Hey Thomas,

Yeah the sc patches were based on top of the big series, so some
collisions expected. I'll look at rebasing.

Thanks,
Nick

