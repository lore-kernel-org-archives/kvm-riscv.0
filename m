From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat, 17 Feb 2024 17:19:54 +1000
Subject: [kvm-unit-tests PATCH v4 8/8] migration: add a migration
 selftest
In-Reply-To: <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
 <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
Message-ID: <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Feb 16, 2024 at 9:15 PM AEST, Thomas Huth wrote:
> On 09/02/2024 10.11, Nicholas Piggin wrote:
> > Add a selftest for migration support in  guest library and test harness
> > code. It performs migrations in a tight loop to irritate races and bugs
> > in the test harness code.
> > 
> > Include the test in arm, s390, powerpc.
> > 
> > Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arm/Makefile.common          |  1 +
> >   arm/selftest-migration.c     |  1 +
> >   arm/unittests.cfg            |  6 ++++++
>
>   Hi Nicholas,
>
> I just gave the patches a try, but the arm test seems to fail for me: Only 
> the first getchar() seems to wait for a character, all the subsequent ones 
> don't wait anymore and just continue immediately ... is this working for 
> you? Or do I need another patch on top?

Hey sorry missed this comment....

It does seem to work for me, I've mostly tested pseries but I did test
others too (that's how I saw the arm getchar limit).

How are you observing it not waiting for migration? I put some sleeps in
the migration script before echo'ing to the console input and it seems
to be doing the right thing. Admittedly the test contains no way to
programaticaly verify the machine was migrated the expected number of
times, it would be nice to try to match that up somehow.

Thanks,
Nick

