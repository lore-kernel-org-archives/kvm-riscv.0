From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2021 10:27:59 +0000
Subject: PATCH v4 00/11] KVM: x86/xen: Add in-kernel Xen event channel delivery
Message-ID: <20211120102810.8858-1-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Event channels, yeah. That really is where I started.

It was all so simple in Joao and Ankur's original version at 
https://www.spinics.net/lists/kvm/msg182556.html ? just a handful
of simple test_and_set_bit() calls on the mapped page.

When I posted v1 I didn't quite understand how steal time and nesting
were safely using the kvm_map_gfn() function, and I posted the Xen
part declaring that I had "reduced it to a previously solved problem".

Then I frowned at kvm_map_gfn() for a bit longer, concluded it was
basically impossible to use it safely on its own because the page it
maps might belong to another guest by the time it even returns to its
caller, and posted a v2 in which I did something safer for myself by
hooking into the MMU notifiers.

I then fixed the steal time reporting, and killed gfn_to_pfn_cache,
under separate cover.

In v3 of this series I re-introduced a saner gfn_to_pfn_cache with MMU 
notifier support to give it proper invalidation semantics. This can now 
be used for the Xen event channel support and should also be usable for 
fixing the various use-after-free races in the nesting code too ? the 
last patch in this series being an untested proof of concept attempt at 
fixing one such.

Since adding a C file in virt/kvm/ was somewhat more painful than it
really should have been, there is a small detour into all the arch
specific Makefiles to make them include a common one.

v4: Rework the dirty marking given the relevation that it can only be 
done from the context of an active vCPU. So just defer it to happen in 
the unmap. Also introduce a lightweight unmap call instead of just the 
full destroy. Document the Xen shared info page as NOT participating in 
dirty tracking. Fix a typo in the CONFIG_HAVE_KVM_DIRTY_RING patch which 
prevented the capability from being advertised.

Intended for merging up to patch 10. Patch 11 is for illustration.




