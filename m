From: Nicholas Piggin <npiggin@gmail.com>
Date: Mon, 26 Feb 2024 18:10:02 +1000
Subject: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
In-Reply-To: <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
 <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
Message-ID: <CZEUWE22JA80.3S73L9F5A04RK@wheely>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Feb 23, 2024 at 5:06 PM AEST, Thomas Huth wrote:
> On 21/02/2024 04.27, Nicholas Piggin wrote:
> > Now that strange arm64 hang is found to be QEMU bug, I'll repost.
> > Since arm64 requires Thomas's uart patch and it is worse affected
> > by the QEMU bug, I will just not build it on arm. The QEMU bug
> > still affects powerpc (and presumably s390x) but it's not causing
> > so much trouble for this test case.
> > 
> > I have another test case that can hit it reliably and doesn't
> > cause crashes but that takes some harness and common lib work so
> > I'll send that another time.
> > 
> > Since v4:
> > - Don't build selftest-migration on arm.
> > - Reduce selftest-migration iterations from 100 to 30 to make the
> >    test run faster (it's ~0.5s per migration).
>
> Thanks, I think the series is ready to go now ... we just have to wait for 
> your QEMU TCG migration fix to get merged first. Or should we maybe mark the 
> selftest-migration with "accel = kvm" for now and remove that line later 
> once QEMU has been fixed?

Could we merge it? I'm juggling a bunch of different things and prone to
lose track of something :\ I'll need to drum up a bit of interest to
review the QEMU fixes from those who know the code too, so that may take
some time.

I left it out of arm unittests.cfg entirely, and s390 and powerpc seems
to work by luck enough to be useful for gitlab CI so I don't think there
is a chnage needed really unless you're paranoid.

I do have a later patch that adds a memory tester that does trigger it
right away on powerpc. I'll send that out after this series is merged...
but we do still have the issue that the gitlab CI image has the old QEMU
don't we? Until we update distro.

Thanks,
Nick


