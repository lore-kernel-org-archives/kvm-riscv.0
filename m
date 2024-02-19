From: Nicholas Piggin <npiggin@gmail.com>
Date: Mon, 19 Feb 2024 22:02:32 +1000
Subject: [kvm-unit-tests PATCH v4 8/8] migration: add a migration
 selftest
In-Reply-To: <4d73467d-2091-4342-87a1-822f4aeb8b70@redhat.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
 <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
 <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
 <4d73467d-2091-4342-87a1-822f4aeb8b70@redhat.com>
Message-ID: <CZ91GLI40959.3EGSUC8X9D0WU@wheely>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon Feb 19, 2024 at 4:56 PM AEST, Thomas Huth wrote:
> On 17/02/2024 08.19, Nicholas Piggin wrote:
> > On Fri Feb 16, 2024 at 9:15 PM AEST, Thomas Huth wrote:
> >> On 09/02/2024 10.11, Nicholas Piggin wrote:
> >>> Add a selftest for migration support in  guest library and test harness
> >>> code. It performs migrations in a tight loop to irritate races and bugs
> >>> in the test harness code.
> >>>
> >>> Include the test in arm, s390, powerpc.
> >>>
> >>> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> >>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >>> ---
> >>>    arm/Makefile.common          |  1 +
> >>>    arm/selftest-migration.c     |  1 +
> >>>    arm/unittests.cfg            |  6 ++++++
> >>
> >>    Hi Nicholas,
> >>
> >> I just gave the patches a try, but the arm test seems to fail for me: Only
> >> the first getchar() seems to wait for a character, all the subsequent ones
> >> don't wait anymore and just continue immediately ... is this working for
> >> you? Or do I need another patch on top?
> > 
> > Hey sorry missed this comment....
> > 
> > It does seem to work for me, I've mostly tested pseries but I did test
> > others too (that's how I saw the arm getchar limit).
> > 
> > How are you observing it not waiting for migration?
>
> According to you other mail, I think you figured it out already, but just 
> for the records: You can see it when running the guest manually, e.g. 
> something like:
>
>   qemu-system-aarch64 -nodefaults -machine virt -accel tcg -cpu cortex-a57 \
>     -device virtio-serial-device -device virtconsole,chardev=ctd \
>     -chardev testdev,id=ctd -device pci-testdev -display none \
>     -serial mon:stdio -kernel arm/selftest-migration.flat -smp 1
>
> Without my "lib/arm/io: Fix calling getchar() multiple times" patch, the 
> guest only waits during the first getchar(), all the others simply return 
> immediately.

Yeah I got it -- I re-ran it on arm and it is obvious since you told
me it's not waiting. At the time I tested I thought it was just arm
migrating really fast :D

Thanks,
Nick

