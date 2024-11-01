From: Mark Brown <broonie@kernel.org>
Date: Fri, 1 Nov 2024 16:37:09 +0000
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <ZyUARgGV4G6DOrRL@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
 <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev>
 <ZyT-6iCNlA1VSAV3@google.com>
 <ZyUARgGV4G6DOrRL@linux.dev>
Message-ID: <0bd90020-4175-48f9-9017-2eb6073101d0@sirena.org.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 01, 2024 at 09:22:30AM -0700, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:

> > One thing I'll add to my workflow would be to do a local merge (and smoke test)
> > of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> > this cycle where such a sanity check would have saved me and others a bit of pain.

> Eh, shit happens, that's what -next is for :)

> The only point I wanted to make was that it is perfectly fine by me to
> spread the workload w/ a topic branch if things blow up sometime after
> your changes show up in -next.

Yeah, the -next breakage is a bit annoying but so long as it gets fixed
promptly it's kind of what it's there for.  It's much more of an issue
when things make it into mainline, and can be very problematic if it
makes it into a tagged -rc (especially -rc1) or something.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20241101/909583d6/attachment.sig>
