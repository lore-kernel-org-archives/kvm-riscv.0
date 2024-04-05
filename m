From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 15:59:15 +0200
Subject: [kvm-unit-tests RFC PATCH 00/17] add shellcheck support
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405-20fbe979a00acc8b9d161936@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:32PM +1000, Nicholas Piggin wrote:
> I foolishly promised Andrew I would look into shellcheck, so here
> it is.

Thanks! I hope you only felt foolish since it was recently April
Fool's day, though.

> 
> https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc?ref_type=heads
> 
> This is on top of the "v8 migration, powerpc improvements" series. For
> now the patches are a bit raw but it does get down to zero[*] shellcheck
> warnings while still passing gitlab CI.
> 
> [*] Modulo the relatively few cases where they're disabled or
> suppressed.
> 
> I'd like comments about what should be enabled and disabled? There are
> quite a lot of options. Lots of changes don't fix real bugs AFAIKS, so
> there's some taste involved.

Yes, Bash is like that. We should probably eventually have a Bash style
guide as well as shellcheck and then tune shellcheck to the guide as
best we can.

> 
> Could possibly be a couple of bugs, including in s390x specific. Any
> review of those to confirm or deny bug is appreciated. I haven't tried
> to create reproducers for them.
> 
> I added a quick comment on each one whether it looks like a bug or
> harmless but I'm not a bash guru so could easily be wrong. I would
> possibly pull any real bug fixes to the front of the series and describe
> them as proper fix patches, and leave the other style / non-bugfixes in
> the brief format.  shellcheck has a very good wiki explaining each issue
> so there is not much point in rehashing that in the changelog.
> 
> One big thing kept disabled for now is the double-quoting to prevent
> globbing and splitting warning that is disabled. That touches a lot of
> code and we're very inconsistent about quoting variables today, but it's
> not completely trivial because there are quite a lot of places that does
> rely on splitting for invoking commands with arguments. That would need
> some rework to avoid sprinkling a lot of warning suppressions around.
> Possibly consistently using arrays for argument lists would be the best
> solution?

Yes, switching to arrays and using double-quoting would be good, but we
can leave it for follow-on work after a first round of shellcheck
integration.

Thanks,
drew

> 
> Thanks,
> Nick
> 
> Nicholas Piggin (17):
>   Add initial shellcheck checking
>   shellcheck: Fix SC2223
>   shellcheck: Fix SC2295
>   shellcheck: Fix SC2094
>   shellcheck: Fix SC2006
>   shellcheck: Fix SC2155
>   shellcheck: Fix SC2235
>   shellcheck: Fix SC2119, SC2120
>   shellcheck: Fix SC2143
>   shellcheck: Fix SC2013
>   shellcheck: Fix SC2145
>   shellcheck: Fix SC2124
>   shellcheck: Fix SC2294
>   shellcheck: Fix SC2178
>   shellcheck: Fix SC2048
>   shellcheck: Fix SC2153
>   shellcheck: Suppress various messages
> 
>  .shellcheckrc           | 32 +++++++++++++++++++++++++
>  Makefile                |  4 ++++
>  README.md               |  2 ++
>  arm/efi/run             |  4 ++--
>  riscv/efi/run           |  4 ++--
>  run_tests.sh            | 11 +++++----
>  s390x/run               |  8 +++----
>  scripts/arch-run.bash   | 52 ++++++++++++++++++++++++++++-------------
>  scripts/common.bash     |  5 +++-
>  scripts/mkstandalone.sh |  4 +++-
>  scripts/runtime.bash    | 14 +++++++----
>  scripts/s390x/func.bash |  2 +-
>  12 files changed, 106 insertions(+), 36 deletions(-)
>  create mode 100644 .shellcheckrc
> 
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

