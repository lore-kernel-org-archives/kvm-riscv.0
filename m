From: Thomas Huth <thuth@redhat.com>
Date: Fri, 23 Feb 2024 08:06:21 +0100
Subject: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
Message-ID: <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21/02/2024 04.27, Nicholas Piggin wrote:
> Now that strange arm64 hang is found to be QEMU bug, I'll repost.
> Since arm64 requires Thomas's uart patch and it is worse affected
> by the QEMU bug, I will just not build it on arm. The QEMU bug
> still affects powerpc (and presumably s390x) but it's not causing
> so much trouble for this test case.
> 
> I have another test case that can hit it reliably and doesn't
> cause crashes but that takes some harness and common lib work so
> I'll send that another time.
> 
> Since v4:
> - Don't build selftest-migration on arm.
> - Reduce selftest-migration iterations from 100 to 30 to make the
>    test run faster (it's ~0.5s per migration).

Thanks, I think the series is ready to go now ... we just have to wait for 
your QEMU TCG migration fix to get merged first. Or should we maybe mark the 
selftest-migration with "accel = kvm" for now and remove that line later 
once QEMU has been fixed?

  Thomas



