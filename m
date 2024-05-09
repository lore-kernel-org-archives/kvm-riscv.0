From: Edward Liaw <edliaw@google.com>
Date: Thu, 9 May 2024 10:45:31 -0700
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
In-Reply-To: <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
References: <20240507214254.2787305-1-edliaw@google.com> <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
 <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com> <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
Message-ID: <CAG4es9V2CcBJr0josSoGNsD+ZPQ6vasVXh_Hc_j88oeSqn__yQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 9, 2024 at 7:37?AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/9/24 00:13, Edward Liaw wrote:
> > On Wed, May 8, 2024 at 4:10?PM Shuah Khan <skhan@linuxfoundation.org> wrote:
> >>
> >> On 5/7/24 15:38, Edward Liaw wrote:
> >>> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> >>> asprintf into kselftest_harness.h, which is a GNU extension and needs
> >>> _GNU_SOURCE to either be defined prior to including headers or with the
> >>> -D_GNU_SOURCE flag passed to the compiler.
> >>>
> >>> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw at google.com/
> >>> v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> >>> location.  Remove #define _GNU_SOURCE from source code to resolve
> >>> redefinition warnings.
> >>>
> >>> Edward Liaw (5):
> >>>     selftests: Compile kselftest headers with -D_GNU_SOURCE
> >>>     selftests/sgx: Include KHDR_INCLUDES in Makefile
> >>
> >> I appled patches 1/5 and 2.5 - The rest need to be split up.
> >>
> >>>     selftests: Include KHDR_INCLUDES in Makefile
> >>>     selftests: Drop define _GNU_SOURCE
> >>>     selftests: Drop duplicate -D_GNU_SOURCE
> >>>
> >>
> >> Please split these patches pwe test directory. Otherwise it will
> >> cause merge conflicts which can be hard to resolve.
> >
> > Hi Shuah,
> > Sean asked that I rebase the patches on linux-next, and I will need to
> > remove additional _GNU_SOURCE defines.  Should I send an unsplit v3 to
> > be reviewed, then split it afterwards?  I'm concerned that it will be
> > difficult to review with ~70 patches once split.
>
> Please send them split - it will be easier to review and apply. You
> might as well wait until the merge window is done. I don't think
> anybody would have time to review now since merge window starts
> next week.

Sorry, I have them split already; is it ok if I send them now?  I will
be on leave soon and may not be able to get back to it in a while.

Thanks,
Edward

>
>
> thanks,
> -- Shuah

