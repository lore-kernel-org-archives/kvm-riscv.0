From: Sean Christopherson <seanjc@google.com>
Date: Fri, 1 Nov 2024 09:31:05 -0700
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <ZyUARgGV4G6DOrRL@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev> <ZyT-6iCNlA1VSAV3@google.com> <ZyUARgGV4G6DOrRL@linux.dev>
Message-ID: <ZyUCSZEv4w1yXwEb@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:
> > One thing I'll add to my workflow would be to do a local merge (and smoke test)
> > of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> > this cycle where such a sanity check would have saved me and others a bit of pain.
> 
> Eh, shit happens, that's what -next is for :)

Heh, but I also don't actually test -next, which was another snafu (not my fault
this time!) from this cycle[*].  Testing 6.12-next prior to the merge window
wouldn't have made that any less painful to bisect, but I think it would at least
have allowed me to detect that the issue specifically came in from linux-next,
and the bug report would have gotten to PeterZ almost two months earlier.

https://lore.kernel.org/all/ZwdA0sbA2tJA3IKh at google.com

