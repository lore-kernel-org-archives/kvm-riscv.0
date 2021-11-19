From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 19 Nov 2021 09:23:29 +0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <YZatsB3oadj6dgb8@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com> <YZagjzYUsixbFre9@google.com>
 <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
 <YZatsB3oadj6dgb8@google.com>
Message-ID: <0d8cd126fb15488ae1b523f799fe749f02c4cc8c.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-11-18 at 19:46 +0000, Sean Christopherson wrote:
> It is sufficient for the current physical CPU to have an active vCPU, which is
> generally guaranteed in the MMU code because, with a few exceptions, populating
> SPTEs is done in vCPU context.
> 
> mmap() will never directly trigger SPTE creation, KVM first requires a vCPU to
> fault on the new address.  munmap() is a pure zap flow, i.e. won't create a
> present SPTE and trigger the writeback of the dirty bit.

OK, thanks.

> That's also why I dislike using kvm_get_running_vcpu(); when it's needed, there's
> a valid vCPU from the caller, but it deliberately gets dropped and indirectly
> picked back up.

Yeah. So as things stand we have a kvm_write_guest() function which
takes a 'struct kvm *', as well as a kvm_vcpu_write_guest() function
which takes a 'struct kvm_vcpu *'.

But it is verboten to *use* the kvm_write_guest() or mark_page_dirty()
functions unless you actually *do* have an active vCPU. Do so, and the
kernel might just crash; not even a graceful failure mode.

That's a fairly awful bear trap that has now caught me *twice*. I'm
kind of amused that in all my hairy inline asm and pinning and crap for
guest memory access, the thing that's been *broken* is where I just
used the *existing* kvm_write_wall_clock() which does the simple
kvm_write_guest() thing.

I think at the very least perhaps we should do something like this in
mark_page_dirty_in_slot():

 WARN_ON_ONCE(!kvm_get_running_vcpu() || kvm_get_running_vcpu()->kvm != kvm);

(For illustration only; I'd actually use a local vcpu variable *and*
pass that vcpu to kvm_dirty_ring_get())

On propagating the caller's vcpu through and killing off the non-vCPU
versions of the functions, I'm torn... because even if we insist on *a*
vCPU being passed, it might be *the* vCPU, and that's just setting a
more subtle trap (which would have bitten my GPC invalidate code, for
example).

There are other more complex approaches like adding an extra ring, with
spinlocks, for the 'not from a vCPU' cases. But I think that's
overkill.






-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211119/5d1d906a/attachment.p7s>
