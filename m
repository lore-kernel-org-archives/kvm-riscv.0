From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 23:13:51 -0700
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
In-Reply-To: <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
References: <20240507214254.2787305-1-edliaw@google.com> <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
Message-ID: <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 8, 2024 at 4:10?PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 5/7/24 15:38, Edward Liaw wrote:
> > 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> > asprintf into kselftest_harness.h, which is a GNU extension and needs
> > _GNU_SOURCE to either be defined prior to including headers or with the
> > -D_GNU_SOURCE flag passed to the compiler.
> >
> > v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw at google.com/
> > v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> > location.  Remove #define _GNU_SOURCE from source code to resolve
> > redefinition warnings.
> >
> > Edward Liaw (5):
> >    selftests: Compile kselftest headers with -D_GNU_SOURCE
> >    selftests/sgx: Include KHDR_INCLUDES in Makefile
>
> I appled patches 1/5 and 2.5 - The rest need to be split up.
>
> >    selftests: Include KHDR_INCLUDES in Makefile
> >    selftests: Drop define _GNU_SOURCE
> >    selftests: Drop duplicate -D_GNU_SOURCE
> >
>
> Please split these patches pwe test directory. Otherwise it will
> cause merge conflicts which can be hard to resolve.

Hi Shuah,
Sean asked that I rebase the patches on linux-next, and I will need to
remove additional _GNU_SOURCE defines.  Should I send an unsplit v3 to
be reviewed, then split it afterwards?  I'm concerned that it will be
difficult to review with ~70 patches once split.

