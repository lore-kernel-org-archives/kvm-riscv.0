From: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Jul 2023 13:16:26 -0700
Subject: [RFC PATCH v11 00/29]  KVM: guest_memfd() and per-page attributes
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
Message-ID: <ZL7cGrJNV3//wsXD@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dropped non-KVM folks from Cc: so as not to bother them too much.

On Tue, Jul 18, 2023, Sean Christopherson wrote:
> This is the next iteration of implementing fd-based (instead of vma-based)
> memory for KVM guests.  If you want the full background of why we are doing
> this, please go read the v10 cover letter[1].
> 
> The biggest change from v10 is to implement the backing storage in KVM
> itself, and expose it via a KVM ioctl() instead of a "generic" sycall.
> See link[2] for details on why we pivoted to a KVM-specific approach.
> 
> Key word is "biggest".  Relative to v10, there are many big changes.
> Highlights below (I can't remember everything that got changed at
> this point).
> 
> Tagged RFC as there are a lot of empty changelogs, and a lot of missing
> documentation.  And ideally, we'll have even more tests before merging.
> There are also several gaps/opens (to be discussed in tomorrow's PUCK).

I've pushed this to

  https://github.com/kvm-x86/linux/tree/guest_memfd

along with Isaku's fix for the lock ordering bug on top.

As discussed at PUCK, I'll apply fixes/tweaks/changes on top until development
stabilizes, and will only squash/fixup when we're ready to post v12 for broad
review.

Please "formally" post patches just like you normally would do, i.e. don't *just*
repond to the buggy mail (though that is also helpful).  Standalone patches make
it easier for me to manage things via lore/b4.

If you can, put gmem or guest_memfd inside the square braces, e.g.

  [PATCH gmem] KVM: <shortlog>

so that it's obvious the patch is intended for the guest_memfd branch.  For fixes,
please also be sure to use Fixes: tags and split patches to fix exactly one base
commit, again to make my life easier.

I'll likely add my own annotations when applying, e.g. [FIXUP] and whatnot, but
that's purely notes for myself for the future squash/rebase.

Thanks!

