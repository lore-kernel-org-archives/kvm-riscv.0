From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat, 06 Apr 2024 16:34:21 +1000
Subject: [kvm-unit-tests RFC PATCH 00/17] add shellcheck support
In-Reply-To: <20240405-20fbe979a00acc8b9d161936@orel>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405-20fbe979a00acc8b9d161936@orel>
Message-ID: <D0CTWX0N023S.3U58HCNRJDC1R@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Apr 5, 2024 at 11:59 PM AEST, Andrew Jones wrote:
> On Fri, Apr 05, 2024 at 07:00:32PM +1000, Nicholas Piggin wrote:
> > I foolishly promised Andrew I would look into shellcheck, so here
> > it is.
>
> Thanks! I hope you only felt foolish since it was recently April
> Fool's day, though.

Hah, no it was fine, it was a good idea and I've been mucking with
a lot of the bash so, no worries.

>
> > 
> > https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc?ref_type=heads
> > 
> > This is on top of the "v8 migration, powerpc improvements" series. For
> > now the patches are a bit raw but it does get down to zero[*] shellcheck
> > warnings while still passing gitlab CI.
> > 
> > [*] Modulo the relatively few cases where they're disabled or
> > suppressed.
> > 
> > I'd like comments about what should be enabled and disabled? There are
> > quite a lot of options. Lots of changes don't fix real bugs AFAIKS, so
> > there's some taste involved.
>
> Yes, Bash is like that. We should probably eventually have a Bash style
> guide as well as shellcheck and then tune shellcheck to the guide as
> best we can.

+1

>
> > 
> > Could possibly be a couple of bugs, including in s390x specific. Any
> > review of those to confirm or deny bug is appreciated. I haven't tried
> > to create reproducers for them.
> > 
> > I added a quick comment on each one whether it looks like a bug or
> > harmless but I'm not a bash guru so could easily be wrong. I would
> > possibly pull any real bug fixes to the front of the series and describe
> > them as proper fix patches, and leave the other style / non-bugfixes in
> > the brief format.  shellcheck has a very good wiki explaining each issue
> > so there is not much point in rehashing that in the changelog.
> > 
> > One big thing kept disabled for now is the double-quoting to prevent
> > globbing and splitting warning that is disabled. That touches a lot of
> > code and we're very inconsistent about quoting variables today, but it's
> > not completely trivial because there are quite a lot of places that does
> > rely on splitting for invoking commands with arguments. That would need
> > some rework to avoid sprinkling a lot of warning suppressions around.
> > Possibly consistently using arrays for argument lists would be the best
> > solution?
>
> Yes, switching to arrays and using double-quoting would be good, but we
> can leave it for follow-on work after a first round of shellcheck
> integration.

Okay good, thanks for all the review on it.

Thanks,
Nick

